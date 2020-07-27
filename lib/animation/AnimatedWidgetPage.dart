import 'package:flutter/material.dart';

/// AnimationWidget使用demo
/// AnimationWidget是一个会在传入listenable变化时，自动调用setState重新build的组件。
/// 如果不用这个组件的话，我们要在animation的更新事件中，手动调用setState方法来刷新界面。
/// 如果将动画内容放到AnimatedWidget中，则不用这么做。
class AnimatedLogo extends AnimatedWidget{
  AnimatedLogo({Key key , Animation<double> animation}):super(key:key , listenable : animation);
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
  
}

class AnimatedWidgetPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimatedWidgetPageState();
  }
}

class AnimatedWidgetPageState extends State<AnimatedWidgetPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this
    );

    animation = Tween<double>(begin: 0 , end: 300).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation菜单"),
      ),
      body: AnimatedLogo(animation: animation,)
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}