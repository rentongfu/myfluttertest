
import 'package:flutter/material.dart';

class BasicHeroAnimatePageA extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Hero Animate A"),),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Hero(
              tag: "heroA",
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return BasicHeroAnimatePageB();
                    }));
                  },
                  child: Image.asset("assets/image/a.jpeg"),
                ),
              )),
        ),
      ),
    );
  }
  
}

class BasicHeroAnimatePageB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Hero Animate B"),),
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 100,
          child: Hero(
              tag: "heroA",
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("assets/image/a.jpeg"),
                ),
              )),
        ),
      ),
    );
  }
  
}