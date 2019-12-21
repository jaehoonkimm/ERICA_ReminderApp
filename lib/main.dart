import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
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

// 상단바
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

//    return Center(
//      child: Row(
//        children: <Widget>[
//          // + 아이콘 추가
//          const Icon(
//            Icons.add ,
//            color: Colors.white,
//            size: 50.0,
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 282.0),
//            child: const Icon(
//              Icons.search ,
//              color: Colors.white,
//              size: 50.0,
//            ),
//          ),
//        ],
//      ),
    );
  }
}


class TodoPage extends StatefulWidget {
  @override
  createState() => new TodoPageState();
}

class TodoPageState extends State<TodoPage> {

    List<String> _todoThings = [];

    Widget _buildToDoList() {
      return new ListView.builder(
          itemBuilder: (context, index) {
            if(index < _todoThings.length) {
              return _buildToDoItem(_todoThings[index], index);
            }
          }
      );
    }

    Widget _buildToDoItem(String todoText, int index) {
      return new ListTile(
        title : Text(todoText),
        onTap: () => _promptRemoveTodoItem(index),
      );
    }

    _addToDo(){
      setState((){
        int index = _todoThings.length;
        _todoThings.add('item_$index');
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // List BackGround color
        backgroundColor: Colors.grey[400],
        body: _buildToDoList(),
      );
   }

   @override
    Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
             title: Text("Add Reminder")
         ),
         body: _buildToDoList(),
         floatingActionButton: new FloatingActionButton(
         onPressed: _addToDo,
         tooltip: "+",
         child: new Icon(Icons.add)
     );
   };
}

// 리스트 뷰 구현
//ListView(
//children: <Widget>[
//Container(
//margin: const EdgeInsets.only(
//left: 7.0,
//right: 7.0,
//top: 7.0,
//bottom: 7.0,
//),
//color: Colors.white,
//width: 500.0,
//height: 60.0,
//
//child: ListTile(
//leading: Icon(Icons.arrow_right),
//title: Text("김민경 바보"),
//
//),
//),
//],
//),