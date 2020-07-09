
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){

            },
            child: Text("FlatButton"),
          ),
          RaisedButton(
            onPressed: (){

            },
            child: Text("RaisedButton"),
          ),
          OutlineButton(
            onPressed: (){

            },
            child: Text("OutlineButton"),
          ),
          CupertinoButton(child: Text("CupertinoButton"), onPressed: (){

          }),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                onPressed: (){

                },
                child: Text("RaisedButton"),
              ),
              RaisedButton(
                onPressed: (){

                },
                child: Text("RaisedButton"),
              ),
              RaisedButton(
                onPressed: (){

                },
                child: Text("RaisedButton"),
              ),
            ],
          )
        ],
      ),
    );
  }
  
}