
import 'package:flutter/material.dart';

///
///AnimatedOpacity组件演示demo，AnimatedOpacity是一个会将对其opacity属性的变化通过动画实现渐变效果的组件
///
class AnimatedOpacityPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AnimatedOpacityPageState();
  }
  
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage>{
  double _opacity = 0.0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("AnimatedOpacity"),),
      body: Column(
        children: <Widget>[
          MaterialButton(
            child: Text("Show Details"),
            onPressed: (){
              setState(() {
                _opacity = 1;
              });
            },
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 3),
            opacity: _opacity,
            child: Column(
              children: <Widget>[
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
          )
        ],
      ),
    );
  }
  
}