
import 'dart:math';

import 'package:flutter/material.dart';

///AnimatedContainer使用demo。
///AnimatedContainer从功能上类似于Container，不同的是，它会把对它的属性变化通过动画实现渐变效果。
class AnimatedContainerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AnimatedContainerPageState();
  }

}

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>{
  Color color;
  double borderRadius;
  double margin;

  @override
  initState() {
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }
  static const _duration = Duration(milliseconds: 400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedContainer"),),
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: _duration,
                ),
              ),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                child: Text('change' ),
                onPressed: (){
                  setState(() {
                    color = randomColor();
                    borderRadius = randomBorderRadius();
                    margin = randomMargin();
                    });
                },
              )
            ],
          )
        ),
    );
  }

}