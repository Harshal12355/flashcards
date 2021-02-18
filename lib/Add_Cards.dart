import 'package:flashcards/Properties.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {

  //final Properties properties;
  final questionCon = new TextEditingController();
  final answerCon = new TextEditingController();

  //_addState(this.properties);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Cards"),
        //backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(0, 30, 100, 0),
            child: Container(
              child: Text(
                  'Please enter card information',
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 180, 50, 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: questionCon,
                    decoration: InputDecoration(
                      hintText: "Front",
                    ),
                    cursorColor: Colors.black,
                  ),
                  TextField(
                    controller: answerCon,
                    decoration: InputDecoration(
                      hintText: "Back",
                    ),
                    cursorColor: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30,),
                    child: SizedBox(
                      width: 200,

                      child: RaisedButton(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _sendDataBack(context);
                          },
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    String questionToSendBack = questionCon.text;
    String answerToSendBack = answerCon.text;
    Navigator.pop(context, [questionToSendBack, answerToSendBack]);
  }

}