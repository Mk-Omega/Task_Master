class User {
  String id;
  String api_key;
  String username;
  String lastname;
  String firstname;
  String email;
  String password;

  User(this.id, this.api_key, this.username, this.lastname, this.firstname,
      this.email, this.password);

  User.fromJson(Map<String, dynamic> parsedJson) {
    User user = new User(
        parsedJson['id'],
        parsedJson['api_key'],
        parsedJson['username'],
        parsedJson['lastname'],
        parsedJson['firstname'],
        parsedJson['email'],
        parsedJson['password']);
  }
}
