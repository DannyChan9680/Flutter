import 'package:flutter/material.dart';
import 'qrcode_reader.dart';

void main() => runApp(MyApp());

enum WhyFather {
  harder,
  smarter,
  selfStarter,
  tradingCharter,
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _barcodeString;
  WhyFather _selection;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopMenuButtonPage'),
        actions: <Widget>[
          PopupMenuButton<WhyFather>(
            onSelected: (WhyFather result) {
              setState(() {
                _selection = result;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFather>>[
              const PopupMenuItem<WhyFather>(
                value: WhyFather.harder,
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem<WhyFather>(
                value: WhyFather.smarter,
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem<WhyFather>(
                value: WhyFather.selfStarter,
                child: Text('Being a lot self_starter'),
              ),
              const PopupMenuItem<WhyFather>(
                value: WhyFather.tradingCharter,
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _barcodeString,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return new Text(snapshot.data != null ? snapshot : '');
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
          _barcodeString = new QRCodeReader()
              .setAutoFocusIntervalInMs(200)
              .setForceAutoFocus(true)
              .setTorchEnabled(true)
              .setHandlePermissions(true)
              .setExecuteAfterPermissionGranted(true)
              .setFrontCamera(false)
              .scan();
          });
        },
        tooltip:  'Reader the QRCode',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
