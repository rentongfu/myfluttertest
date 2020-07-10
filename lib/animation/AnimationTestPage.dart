
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationTestPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimationTestPageState();
  }
}

class AnimationTestPageState extends State<AnimationTestPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("ABC"),
      ),
    );
  }

}