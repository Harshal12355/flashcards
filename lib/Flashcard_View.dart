import 'package:flutter/material.dart';

class Flashcard_View extends StatelessWidget {
  String text;


  Flashcard_View({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
