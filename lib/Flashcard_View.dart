import 'package:flutter/material.dart';

class Flashcard_View extends StatelessWidget {
  String text;
  String type;

  Flashcard_View({Key key, this.text, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,),
            child: Text(
              "Type: $type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 110.0),
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
          ),
        ],
      ),
    );
  }
}
