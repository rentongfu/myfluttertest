
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialTestPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return MaterialTestPageState();
  }
}

class MaterialTestPageState extends State<MaterialTestPage> with SingleTickerProviderStateMixin{
    int selectedTabIndex = 0 ;
    TabController tabController;

    @override
    void initState() {
        // TODO: implement initState
        //  super.initState();
        tabController = new TabController(length: 3, vsync: this);
        textEditingController = new TextEditingController();
        scrollController = new ScrollController();
    }

    @override
    void dispose() {
        tabController.dispose();
        textEditingController.dispose();
        scrollController.dispose();
        super.dispose();
    }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text("Material Page"),
              bottom: TabBar(
                  controller: tabController,
                  tabs: <Widget>[
                      Tab(text: "Left",),
                      Tab(text: "Center",),
                      Tab(text: "Right",)
                  ],
              ),
          ),
          body: Center(
              child: createTab(),
          ),
          drawer: Drawer(
              child: Column(
                  children: <Widget>[
                      Text("Drawer Item 1"),
                      Text("Drawer Item 2"),
                      Text("Drawer Item 3"),
                      Text("Drawer Item 3"),
                  ],
              )
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedTabIndex,
              items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.favorite) , title: Text("First")),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite) , title: Text("Second")),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text("Third")),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite) , title: Text("Fourth")),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite) , title: Text("Fifth")),
              ],
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.grey,
              onTap: (index){
                  setState(() {
                    selectedTabIndex = index;
                  });
              },
              type: BottomNavigationBarType.fixed,
          ),
          floatingActionButton: FloatingActionButton(
              child: Text("ss"),
              onPressed: (){

              },
          ),
      );
  }

  bool switchValue = false;
    int radioIndex = 0 ;
    double slideValue = 0 ;
    TextEditingController textEditingController ;
    ScrollController scrollController;

  Widget createTab() {
      if(selectedTabIndex== 0)
          return TabBarView(children: <Widget>[
              Center(child: Text("Tab Left"),),
              Center(child: Text("Tab Center"),),
              Center(child: Text("Tab Right"),),
          ],
              controller: tabController,
          );
      else if(selectedTabIndex == 1){
          return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                  children: <Widget>[
                      ListTile(
                          title: Text("Radio 0"),
                          leading: Radio(value:  0, groupValue:radioIndex, onChanged: (v){
                              setState(() {
                                  radioIndex = v ;
                              });
                          })
                      ),
                      ListTile(
                          title: Text("Radio 1"),
                          leading: Radio(value:  1, groupValue: radioIndex, onChanged: (v){
                              setState(() {
                                  radioIndex = v ;
                              });
                          })
                      ),
                      ListTile(
                          title: Text("Switch"),
                          trailing: Switch(value: switchValue, onChanged: (v){
                              setState(() {
                                  switchValue = v;
                              });
                          }),
                      ),
                      RaisedButton(
                          child: Text("Date Picker"),
                          onPressed: () async{
                              var result = await showDatePicker(context: context, initialDate: DateTime(2020,1,1), firstDate: DateTime(2020,1,1), lastDate: DateTime(2020,1,5));
                          },
                      ),
                      RaisedButton(
                          child: Text("Time Picker"),
                          onPressed: (){
                              showTimePicker(context: context, initialTime: TimeOfDay(hour:8 , minute: 30));
                          },
                      ),
                      TextField(
                          controller: textEditingController,
                          autofocus: false,
                      ),
                      Slider(
                          value: slideValue,
                          onChanged: (v){
                              setState(() {
                                  slideValue = v;
                              });
                          },
                      ),
                      RaisedButton(
                          child: Text("Bottom Sheet"),
                          onPressed: (){
                              showModalBottomSheet(context: context, builder: (context){
                                  return Container(
                                      height: 240,
                                      child: Text("ss"),
                                  );
                              });
                          },
                      ),
                      Image(
                          image: AssetImage("assets/image/a.jpeg"),
                      )
                  ],
              ),
          );
      }
      else
          return Text("This is Tab$selectedTabIndex");

  }

}