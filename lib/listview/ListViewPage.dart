
import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView.separated(
          itemBuilder: (context , index){
            return Material(
              color: Colors.white,
              child: InkWell(
                customBorder: null,
                onTap: () async {
                  print( "列表项$index被点击");
                  var result = await showDialog<String>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext buildContext){
                        return AlertDialog(
                          title: Text("提示"),
                          content: Text( "列表项$index被点击"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("OK"),
                              onPressed: (){
                                Navigator.pop(buildContext , "OK");
                              },
                            ),
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: (){
                                Navigator.pop(buildContext , "Cancel");
                              },
                            )
                          ],
                        );
                      }
                  );
                  if(result == "OK"){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext buildContext){
                          return AlertDialog(
                            title: Text("提示"),
                            content: Text( "用户点击了OK"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  Navigator.pop(buildContext , "OK");
                                },
                              ),
                            ],
                          );
                        }
                    );
                  }else{
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext buildContext){
                          return AlertDialog(
                            title: Text("提示"),
                            content: Text( "用户点击了Cancel"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: (){
                                  Navigator.pop(buildContext , "OK");
                                },
                              ),
                            ],
                          );
                        }
                    );
                  }
                },
                child: Container(
                  padding:  EdgeInsets.fromLTRB(10.0 , 8.0 , 10.0 , 8.0),
                  child: Column(
                    children: <Widget>[
                      Text("ListView Item" , style: TextStyle(fontSize: 18 , color: Color.fromARGB(0xFF, 0, 0, 0)  ),  textAlign: TextAlign.right,),
                      Align(
                        alignment:Alignment.centerRight ,
                        child: Text("2020-05-11 22:29" , style: TextStyle(fontSize: 12 , color: Color.fromARGB(0xFF, 0x7F, 0x7F, 0x7F) ), ),),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ) ,

                ),
              ),
            );
          },
          separatorBuilder: ( context,  index){
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Divider(height:1, color: Color.fromARGB(0xFF, 0, 0, 0 )),
              onTap: (){
                print( "分割线$index被点击");
              },
            );
          },
          itemCount: 20
      ),
    );
  }
  
}