import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(new MaterialApp(
    title: '页面跳转',
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一个页面'),
        backgroundColor: Colors.orange,
      ),
      body: new Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: new Text('跳转'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
          RaisedButton(
            child: new Text('传递数据'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
          ),
          RaisedButton(
            child: new Text('第三页面'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => FourthScreen(),
                  ));
            },
          ),
        ],
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          new Container(
            height: 50,
            width: 70,
            child: new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text(
                '返回',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white54),
              ),
              color: Colors.brown,
            ),
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text(
            '红色+黑色删除线+25号',
            style: new TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.lineThrough,
              decorationColor: const Color(0xff000000),
              fontSize: 25.0,
            ),
          ),
          new Text(
            '橙色+下划线+24号',
            style: new TextStyle(
              color: const Color(0Xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24,
            ),
          ),
          new Text(
            '虚线上划线+23号+倾斜',
            style: new TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23,
              fontStyle: FontStyle.italic,
            ),
          ),
          new Text(
            'serif字体+24号',
            style: new TextStyle(
              fontFamily: 'serif',
              fontSize: 24,
            ),
          ),
          new Text(
            'monospace字体+23号',
            style: new TextStyle(
              fontFamily: 'monospace',
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Text(
            '天蓝色+25号+2行跨度',
            style: new TextStyle(
              color: const Color(0xff4a86e8),
              fontSize: 25,
              height: 2.0,
            ),
          ),
          new Text(
            '24号+2个子母间隔',
            style: new TextStyle(
              fontSize: 24,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('传递数据'),
        backgroundColor: Colors.green,
      ),
      body: new TodosScreen(
        todos: new List.generate(
          10,
          (i) => new Todo('商品 $i 号', '商品 $i 明细'),
        ),
      ),
    );
  }
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(todos[index].title),
            subtitle: new Text(todos[index].description),
            // When a user taps on the ListTile, navigate to the DetailScreen.
            // Notice that we're not only creating a new DetailScreen, we're
            // also passing the current todo through to it!
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${todo.description}'),
      ),
    );
  }
}

class FourthScreen extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<FourthScreen> {

  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第四页面'),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Color(0xffff0000), //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
            TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                  }
              ),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              //登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Color(0xfffffffff),
                        onPressed: (){
                          if((_formKey.currentState as FormState).validate()){
                            
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ), 
            ],
         ),
       ),
    );
  }
}
