import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) => Container(
        child: LinearProgressIndicator(),
      );
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  var _currentProcess =
      1; //0: loading, 1: form, 2: application finish, 10: prev, 11: after

  Widget _getCurrentWidget() {
    switch (this._currentProcess) {
      case 0:
        return Loading();
      case 1:
        return Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(30),
                child: Text(
                  "이름을 입력해주세요.",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.left,
                )),
            Container(
                margin: const EdgeInsets.all(30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "이름",
                  ),
                  style: TextStyle(),
                )),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "학번",
                  ),
                  style: TextStyle(),
                )),
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
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: FractionallySizedBox(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "동래고등학교 진로 체험 신청",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Center(child: Divider()),
                //margin: const EdgeInsets.all(30),
              ),
              _getCurrentWidget(),
            ],
          )),
          widthFactor: 0.8,
          alignment: Alignment.center,
        )),
      );
}
