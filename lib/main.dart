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
            backgroundColor: Colors.teal,
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
        return _buildItem(_todoThings[index], index);
      }
    });
  }

//  _buildSwipe(int index) {
//    return Dismissible(
//      key: Key(_todoThings[index]),
//      onDismissed: (direction) {
//        setState(() {
//          _todoThings.removeAt(index);
//        });
//      },
//    );
//  }

  // ToDo_List 목록에 추가하는 위젯
  _buildItem(String todoText, int index) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 15.0,
      ),
      color: Colors.green[400],
      width: 500.0,
      height: 60.0,
      child: new ListTile(
        title: Text(todoText,
        style:
        TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30.0,
          color: Colors.white,
        ),
        ),
        onTap: () => _removeTodo(index),
      ),
    );
  }

//
//  // ToDo_List 목록에 추가하는 위젯
//  _buildItem(String todoText, int index) {
//    return new ListTile(
//      title: Text(todoText,
//        style:
//        TextStyle(
//          fontSize: 30.0,
//          color: Colors.white,
//        ),
//      ),
//      onTap: () => _removeTodo(index),
//    );
//  }

  void _removeTool(int index) {
    setState(() => _todoThings.removeAt(index));
  }

  //ToDo_List Things 선택(onTap)시 반응 위젯
  _removeTodo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('"${_todoThings[index]}" Completed this task?'),
          actions: <Widget>[
            new FlatButton(
                onPressed: ()=> Navigator.of(context).pop(),
                child: new Text('Cancel'),
            ),
            new FlatButton(
                onPressed: () {
                  _removeTool(index);
                  Navigator.of(context).pop();
                },
                child: new Text('Complete'),
            )
          ]
        );
      }
    );
  }


  _addItem(String item) {
    setState(() {
      _todoThings.add(item);
    });
  }

  _navigatorAddScreen() async {
    Map results = await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return AddScreen();
      },
    ));
    if (results != null && results.containsKey("item")) {
      _addItem(results["item"]);
    }
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


// ToDo_Things 추가 Page
class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          backgroundColor: Colors.teal,
          bottom: PreferredSize( //PreferredSize를 통해 Text Style 재정의 가능
        child: Text("Add To Do Things",
        style:
          TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )
        ),
        ),
        ),
        backgroundColor: Colors.grey[400],
        body: Container(
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 15.0,
            bottom: 10.0,
          ),
          color: Colors.green[400],
          width: 500.0,
          height: 60.0,
          child: TextField(
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              color: Colors.white,
            ),
            autofocus: true,
            onSubmitted: (val) {
              Navigator.of(context).pop({'item': val});
            },
          ),
        ));
  }
}
