import 'package:flashcards/Flashcard_View.dart';
import 'package:flashcards/Properties.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'Add_Cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashCards',
      debugShowCheckedModeBanner: false,
      home: Flashcard(),
    );
  }
}

class Flashcard extends StatefulWidget {
  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  String question;
  String answer;
  List<Properties> _properties = [
    Properties(question: "Andare", answer: "To go"),
    Properties(question: "Studiare", answer: "To study"),
    Properties(question: "Chiamare", answer: "To call"),
    Properties(question: "Cucinare", answer: "To cook"),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text("Flash Cards"),
       ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Flashcards Pack:",
                  style: TextStyle(
                      fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text(
                      "Italian Words",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 350,
                width: 350,
                child: FlipCard(
                  front: Flashcard_View(text: _properties[_currentIndex].question, type: "Italian",),
                  back: Flashcard_View(text: _properties[_currentIndex].answer, type: "English",),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton.icon(
                      elevation: 20,
                      color: Colors.white,
                      icon: Icon(Icons.chevron_left),
                      label: Text("Prev"),
                      onPressed: _previousPage,
                    ),
                    RaisedButton.icon(
                      elevation: 20,
                      color: Colors.white,
                      icon: Icon(Icons.chevron_right),
                      label: Text("Next"),
                      onPressed: _nextPage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          _awaitReturnValueFromSecondScreen(context);
        },
      ),
    );
  }

  void _nextPage() {
    setState(() {
      _currentIndex = _currentIndex + 1 < _properties.length ? _currentIndex + 1 : 0;
    });
  }

  void _previousPage() {
    setState(() {
      _currentIndex = _currentIndex - 1 >= 0 ? _currentIndex - 1 : _properties.length - 1;
    });
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => add(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      question = result[0];
      answer = result[1];
      _properties.add(Properties(question: question, answer: answer));
    });
  }
}

