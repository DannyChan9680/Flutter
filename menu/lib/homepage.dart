import 'package:flutter/material.dart';
import 'otherpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('data'),
        backgroundColor: Colors.red,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('DannyChan',style: new TextStyle(color: Colors.blueAccent),),
              accountEmail: new Text('123@163.com',style: new TextStyle(color: Colors.blueAccent),),
              currentAccountPicture: new GestureDetector(
                onTap: () => print('current user'),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage('url'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => print('other user'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('url'),
                  ),
                ),
                new GestureDetector(
                  onTap: () => print('other user'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('url'),
                  ),
                ),
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage('https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg'),
                ),
              ),
            ),
            new ListTile(
              title: new Text('First Page'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new OtherPage('First Page')));
              },
            ),
            new ListTile(
              title: new Text('Second Page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new OtherPage('Second Page')));
              },
            ),
            new ListTile(
              title: new Text('Second Page'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/a');
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text(
          'HomePage',
          style: new TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
