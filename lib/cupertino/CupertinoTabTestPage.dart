
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabTestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Text("First", style: TextStyle(fontSize: 14),)),
        BottomNavigationBarItem(icon: Text("Second", style: TextStyle(fontSize: 14),)),
        BottomNavigationBarItem(icon: Text("Third", style: TextStyle(fontSize: 14),)),
        BottomNavigationBarItem(icon: Text("Fourth", style: TextStyle(fontSize: 14),)),
        BottomNavigationBarItem(icon: Text("Fifth", style: TextStyle(fontSize: 14),)),
      ],
    ), tabBuilder: (context , index){
      return Center(
        child: Text("This is Tab${index}", style: TextStyle(fontSize: 16),),
      );
    });
  }
  
}