import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: AppBar(
            bottom: PreferredSize(
              child : Text(
                'Reminder List',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              preferredSize: null,
            ),
            backgroundColor: Colors.blue,
            title: TopBar(),
          ),
        ),
        body: TodoPage(),
      ),
    ),
  );
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.add ,
            color: Colors.white,
            size: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 300.0),
            child: const Icon(
              Icons.search ,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],

      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 500.0,
                height: 110.0,
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 500.0,
                height: 110.0,
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 500.0,
                height: 110.0,
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 500.0,
                height: 110.0,
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 500.0,
                height: 110.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}