
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabTestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Text("First")),
        BottomNavigationBarItem(icon: Text("Second")),
        BottomNavigationBarItem(icon: Text("Third")),
        BottomNavigationBarItem(icon: Text("Fourth")),
        BottomNavigationBarItem(icon: Text("Fifth")),
      ],
    ), tabBuilder: (context , index){
      return Center(
        child: Text("This is Tab${index}"),
      );
    });
  }
  
}