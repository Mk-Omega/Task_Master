from flask_restful import Resource
from flask import request
from models import db, User
import random
import string

class Signup(Resource):
    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0, len(users)):
            user_list.append(users[i].serialize())

        return {"status" : "success", "data": str(user_list)}, 200

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data provided'}, 400

        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return {'message': 'This username is already taken'}, 400

        emailaddress = User.query.filter_by(email=json_data['email']).first()
        if emailaddress:
            return {'message': 'This email is already taken'}, 400

        api_key = self.generate_key()
        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API key already exist'}, 400

        user = User(
            api_key = api_key,
            username = json_data['username'],
            firstname = json_data['firstname'],
            lastname = json_data['lastname'],
            password = json_data['password'],
            email = json_data['email'],
        )

        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)

        return { "status": 'success', 'data': result }, 201

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(20))