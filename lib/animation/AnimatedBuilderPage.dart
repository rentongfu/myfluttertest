
import 'package:flutter/material.dart';

class _LogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

class _GrowTransition extends StatelessWidget{
  final Widget child ;
  final Animation<double> animation ;

  _GrowTransition({this.child , this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context , child){
          return Container(
            height: animation.value,
            width:  animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class AnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedBuilderPageState();
  }
}

class AnimatedBuilderPageState extends State<AnimatedBuilderPage>with SingleTickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _controller ;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(seconds: 2) , vsync: this);
    _animation = Tween<double>(begin: 0 , end: 300).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation菜单"),
      ),
      body: _GrowTransition(
        child: _LogoWidget(),
        animation: _animation,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}