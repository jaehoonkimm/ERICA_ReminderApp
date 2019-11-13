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
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        body: TodoPage(),
      ),
    ),
  );
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Column(
            children: [
//              Container(
//                margin: const EdgeInsets.all(8.0),
//                color: Colors.white,
//                width: 500.0,
//                height: 110.0,
//              ),
            ],
          ),
        ],
      ),
    );
  }
}