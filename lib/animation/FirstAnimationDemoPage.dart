import 'package:flutter/material.dart';

class FirstAnimationDemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FirstAnimationDemoPageState();
  }
}

class FirstAnimationDemoPageState extends State<FirstAnimationDemoPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    );

    animation = Tween<double>(begin: 0 , end: 300).animate(animationController)
    ..addListener(() {
      setState(() {

      });
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation菜单"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}