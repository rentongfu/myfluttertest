
import 'package:flutter/material.dart';

///非线性变化动画CurvedAnimation的使用demo
///与Animation类不同的是，CurvedAnimation可以以非线性的节奏来产生变化值，而Animation只能产生均匀变化的值。
class _AnimatedLogo extends AnimatedWidget{
  static final _opacityTween = Tween<double>(begin:0.1 , end: 1);
  static final _sizeTween = Tween<double>(begin:0 , end : 300);

  _AnimatedLogo({Key key ,Animation<double> animation}):super(key:key , listenable:animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),),
    );
  }
  
}

class CarvedAnimationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CaurvedAnimationPageState();
  }
}

class CaurvedAnimationPageState extends State<CarvedAnimationPage> with SingleTickerProviderStateMixin{
  Animation<double> _animation ;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(seconds: 2) , vsync:  this);
    _animation = CurvedAnimation(parent: _controller , curve: Curves.easeIn)
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          _controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          _controller.forward();
        }
      });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation菜单"),
      ),
      body: _AnimatedLogo(animation: _animation,),
    );
  }

}