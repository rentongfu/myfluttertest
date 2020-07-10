import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluttertest/button/ButtonPage.dart';
import 'package:myfluttertest/cupertino/CupertinoTestPage.dart';
import 'package:myfluttertest/gridview/GridViewPage.dart';
import 'package:myfluttertest/listview/ListViewPage.dart';

import 'material/MaterialTestPage.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MaterialTestPage();
              }));
            },
              child: Text("Material"),),
            RaisedButton(
              child: Text("Cupertino"),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context){
                  return CupertinoTestPage();
                }));
              },
            ),
            RaisedButton(
              child: Text("ListView"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return ListViewPage();
                }));
              },
            ),
            RaisedButton(
              child: Text("GridView"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return GridViewPage();
                }));
              },
            ),
            RaisedButton(
              child: Text("Animation"),
              onPressed: (){

              },
            )
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
