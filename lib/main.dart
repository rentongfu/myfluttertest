import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluttertest/button/ButtonPage.dart';
import 'package:myfluttertest/cupertino/CupertinoTestPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("Button"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ButtonPage();
                    }));
                  },
                ),
              )
            ],),
            RaisedButton(onPressed: (){

            },
            child: Text("Material"),),
            RaisedButton(
              child: Text("Cupertino"),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                  return CupertinoTestPage();
                }));
              },
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}