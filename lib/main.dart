import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(140.0),
            child: new AppBar(
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
              actions: <Widget>[
                  Expanded(
                    child: new IconButton(
                        icon: Icon(Icons.delete,
                        size: 50.0,
                        color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _todoThings = [];
                            showSimpleNotification(
                              Center(
                                child: Container(
                                  child: Text("Task All removed",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                ),
                              ),
                              background: Colors.lightBlue,
                            );
                          });
                        }),
                  ),
              ],
            ),
          ),
          body: TodoPage(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
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
            color: Colors.teal,
            size: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 282.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}

// To Do Item을 담는 List
List<String> _todoThings = [];

// Todo_Page 표출하는 본체 class
class TodoPage extends StatefulWidget {
  @override
  createState() => new TodoPageState();
}
class TodoPageState extends State<TodoPage> {
  @override

  // Item 추가시 _buildItem 전 경유하는 build 위젯
  Widget _buildList() {
    return new ListView.builder(
        itemBuilder: (context, index) {
          if (index < _todoThings.length) {
            return _buildItem(_todoThings[index], index);
          }
        });
  }

  _deleteAllItem() {
    setState(() => _todoThings = []
    );
  }

  // ToDo_List 목록에 추가하는 위젯
  _buildItem(String todoText, int index) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 15.0,
      ),
      color: Colors.teal[200],
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

  // Item 삭제 기능 구현
  void _removeTool(int index) {
    setState(() => _todoThings.removeAt(index));
    showSimpleNotification(
      Center(
        child: Container(
          child: Text("Task Completed",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),),
        ),
      ),
      background: Colors.lightBlue,
    );
  }

  //ToDo_List Things 선택(onTap)시 반응 위젯
  _removeTodo(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              backgroundColor: Colors.teal[200],
              title: new Text('"${_todoThings[index]}" Completed this task?',
                style:
                TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
//                  textBaseline: TextBaseline.ideographic,
                ),
              ),
//              shape: CircleBorder(),
//              contentPadding: EdgeInsets.all(150.0),
              actions: <Widget>[
                new FlatButton(
                  color: Colors.white,
                  onPressed: ()=> Navigator.of(context).pop(),
                  child: new Text('Cancel',
                    style:
                    TextStyle(
                      color: Colors.teal[200],
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),),
                ),
                new FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    _removeTool(index);
                    Navigator.of(context).pop();
                  },
                  child: new Text('Complete',
                    style:
                    TextStyle(
                      color: Colors.teal[200],
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),),
                )
              ]
          );
        }
    );
  }

  //Item 추가 기능 밑 Notification 구현된 위젯
  _addItem(String item) {
    showSimpleNotification(
      Center(
        child: Container(
          child: Text("Task Added",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),),
        ),
      ),
      background: Colors.lightBlue,
    );
    setState(() {
      _todoThings.add(item);
    });
  }

  // Screen 전환 밑 AddScreen 호출하는 위젯
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

  // allDelete 기능 구현된 위젯
  Widget allDelete() {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
          onPressed: _deleteAllItem),
    );
  }

  // Scaffold 위젯 생성
  // 실질 화면 구성 Widget
  Widget build(BuildContext context) {
    return new Scaffold(
      // List BackGround color
      backgroundColor: Colors.grey[400],
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.teal[300],
        onPressed: _navigatorAddScreen, //버튼 클릭시 _navigatorAddScreen 함수 작동
        child: new Icon(
          Icons.add,
          size: 50.0,
          color: Colors.white,
        ),
      ),
      body: _buildList(),
    );
  }
}

// ToDo_Things 추가 Page (두 번째 Screen)
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
          color: Colors.teal[200],
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


