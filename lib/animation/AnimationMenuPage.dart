import 'package:flutter/material.dart';
import 'package:myfluttertest/animation/AnimatedBuilderPage.dart';
import 'package:myfluttertest/animation/AnimatedContainerPage.dart';
import 'package:myfluttertest/animation/AnimatedOpacityPage.dart';
import 'package:myfluttertest/animation/AnimatedWidgetPage.dart';
import 'package:myfluttertest/animation/FirstAnimationDemoPage.dart';
import 'package:myfluttertest/animation/BasicHeroAnimatePage.dart';
import 'package:myfluttertest/animation/RadioHeroAnimatePage.dart';

import 'CarvedAnimationPage.dart';

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
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AnimatedBuilderPage();
            }));
          },
          child: Text("AnimatedBuilder"),),
          RaisedButton(
            child: Text("CurvedAnimation"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CarvedAnimationPage();
              }));
            },
          ),
          RaisedButton(
            child: Text("AnimatedOpacity"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return AnimatedOpacityPage();
              }));
            },
          ),
          RaisedButton(
            child: Text("AnimatedContainer"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return AnimatedContainerPage();
              }));
            },
          ),
          RaisedButton(
            child: Text("BasicHeroAnimate"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return BasicHeroAnimatePageA();
              }));
            },
          ),
          RaisedButton(
            child: Text("RadioHeroAnimate"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c){
                return RadioHeroAnimatePageA();
              }));
            },
          )
        ],
      ),
    );
  }

}