import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '동래고등학교 진로체험 신청',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "NotoSansKR"),
      home: MainPage(),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(
        child: LinearProgressIndicator(),
      );
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  var _currentProcess = 1; //0: loading, 1: form, 2: application finish, 10: prev, 11: after

  Widget _getCurrentWidget() {
    switch (this._currentProcess) {
      case 0:
        return Loading();
      case 1:
        return Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "학번",
              ),
            )
            ],
        );
    }
    return Container(
      child: Center(
        child: Text("아직 구현안됨"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Center(
            child: FractionallySizedBox(
              child: ListView(
                children: <Widget>[
                  Text(
                    "동래고등학교 진로 체험 신청",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  _getCurrentWidget(),
                ],
              ),
              widthFactor: 0.8,
              alignment: Alignment.center,
            )
        ),
      );
}
