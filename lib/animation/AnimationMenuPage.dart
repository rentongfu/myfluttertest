import 'package:flutter/material.dart';
import 'package:myfluttertest/animation/AnimatedWidgetPage.dart';
import 'package:myfluttertest/animation/FirstAnimationDemoPage.dart';

class AnimationMenuPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimationMenuPageState();
  }
}

class AnimationMenuPageState extends State<AnimationMenuPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation菜单"),
      ),
      body: Column(
        children:<Widget>[
          RaisedButton(
          child: Text("First Animation Demo"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context){
              return FirstAnimationDemoPage();
            }));
          }),
          RaisedButton(
            child: Text("AnimatedWidget"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return AnimatedWidgetPage();
              }));
            },
          ),
        ],
      ),
    );
  }

}