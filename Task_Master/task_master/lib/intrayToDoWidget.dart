import 'package:flutter/material.dart';
import 'global.dart';

class intrayToDo extends StatelessWidget {
  final String title;
  final String keyValue;
  intrayToDo({this.keyValue, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Radio(),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  style: intrayTodoTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
