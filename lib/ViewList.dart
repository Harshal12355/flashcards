import 'package:flashcards/Properties.dart';
import 'package:flutter/material.dart';

class ViewListPage extends StatefulWidget {
  String front;
  String back;
  List<Properties> properties;
  ViewListPage ({ Key key, this.front, this.back, this.properties}): super(key: key);

  @override
  _ViewListPageState createState() => _ViewListPageState();
}

class _ViewListPageState extends State<ViewListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View List"),
      ),
      body: ListView.builder(
        itemCount: widget.properties.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: 3),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(widget.properties[index].question),
                subtitle: Text(widget.properties[index].answer),
              ),
            ),
          );
        },
      ),
    );
  }
}
