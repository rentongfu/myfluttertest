import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluttertest/cupertino/CupertinoTabTestPage.dart';

class CupertinoTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CupertinoTestPageState();
  }
}

class CupertinoTestPageState  extends State<CupertinoTestPage> {
  double sliderValue = 0.0 ;
  bool switchValue = true ;

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          previousPageTitle: "Main",
        ),
        child: SingleChildScrollView(
          child:  Column(
            children: <Widget>[

              CupertinoButton(
                child: Text("Cupertino Dialog"),
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("CupertinoAlertDialog"),
                          content:
                          Text("Hello, this is the content of capertino button."),
                          actions: <Widget>[
                            CupertinoButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pop(context, "OK");
                              },
                            )
                          ],
                        );
                      });
                },
              ),
              CupertinoSlider(
                value: sliderValue,
                onChanged: (v){
                  setState(() {
                    sliderValue = v;
                  });
                },
              ),
              CupertinoActivityIndicator(),
              CupertinoSwitch(
                onChanged: (v){
                  setState(() {
                    switchValue = v;
                  });
                },
                value: switchValue,
              ),
              CupertinoButton(
                child: Text("CupertinoPicker"),
                onPressed: () async {
                  showCupertinoModalPopup(context: context, builder: (context){
                    return Container(
                      height: 240,
                      child: CupertinoPicker(itemExtent: 42, onSelectedItemChanged: (v){
                      }, children: <Widget>[
                        Center(child: Text("France"),),
                        Center(child: Text("Austria"),),
                        Center(child: Text("Brandenburg"),),
                        Center(child: Text("England"),),
                        Center(child: Text("Spain"),),
                        Center(child: Text("Ottoman"),),
                        Center(child: Text("Denmark"),),
                        Center(child: Text("Portugal"),)
                      ],
                      backgroundColor: Colors.white,),
                    );
                  },);
                },
              ),
              CupertinoButton(
                child: Text("CupertinoDatePicker"),
                onPressed: () async{
                  showCupertinoModalPopup(context: context, builder: (context){
                    return Container(
                      height: 240,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime){
//                        Navigator.pop(context);
                        },
                      ),
                    );
                  });
                },
              ),
              CupertinoButton(
                child: Text("CupertinoTimerPicker"),
                onPressed: () async {
                  return showCupertinoModalPopup(context: context, builder: (context){
                    return Container(
                      height: 240,
                      child: CupertinoTimerPicker(
                        onTimerDurationChanged: (t){
                        },
                      ),
                    );
                  });
                },
              ),
              Container(
                width: double.infinity,
                child: CupertinoSegmentedControl(
                  children:<String , Widget>{
                    "First":Text("First" , style: TextStyle(fontSize: 14), ),
                    "Second":Text("Second", style: TextStyle(fontSize: 14),),
                    "Third":Text("Third", style: TextStyle(fontSize: 14),)
                  },
                  onValueChanged: (v){

                  },
                ),
              ),
              CupertinoButton(
                child: Text("CupertinoTabScaffold"),
                onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return CupertinoTabTestPage();
                  }));
                },
              )
            ],
          ),
        ));
  }

}
