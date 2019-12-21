import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: AppBar(
            bottom: PreferredSize(
              child: Text(
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
    return Center(
      child: Row(
        children: <Widget>[
          // + 아이콘 추가
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 282.0),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}

// Todo_Page 표출하는 본체 class
// stateful widget으로 화면 변환이 가
class TodoPage extends StatefulWidget {
  @override
  createState() => new TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  @override


    List<String> _todoThings = [];

    Widget _buildList() {
      return new ListView.builder(
          itemBuilder: (context, index) {
            if (index < _todoThings.length) {
              return _buildItem(_todoThings[index]);
        }
      }
      );
      }

    Widget _buildItem(String todoText) {
      return new ListTile(
        title: Text(todoText),
      );
    }

    _addItem(String item) {
      setState(() {
        //int index = _todoThings.length;
        //_todoThings.add('ToDo_Item_$index');
        _todoThings.add(item);
      });
    }



    // Scaffold 위젯 생성
  Widget build(BuildContext context) {
    return new Scaffold(
      // List BackGround color
      backgroundColor: Colors.grey[400],
      floatingActionButton: new FloatingActionButton(
        onPressed: _navigatorAddScreen, //버튼 클릭시 _addItem 함수 작동
        child: new Icon(
            Icons.add,
            size: 50.0,
            color: Colors.white,
        ),
      ),
      body: _buildList(),
//      body: ListView(
//        children: <Widget>[
//          Container(
//            margin: const EdgeInsets.only(
//              left: 7.0,
//              right: 7.0,
//              top: 7.0,
//              bottom: 7.0,
//            ),
//            color: Colors.white,
//            width: 500.0,
//            height: 60.0,
//
//            child: ListTile(
//              leading: Icon(Icons.arrow_right),
//              title: Text("할 일"),
//            ),
//          ),
//        ],
//      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Add To Do Things")),
        body: TextField(
          autofocus: true,
          onSubmitted: (val) {
            Navigator.of(context).pop({'item': val});
          },
        )
    );
  }
}

