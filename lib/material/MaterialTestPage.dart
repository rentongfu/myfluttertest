
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
    String dropdownValue = 'One';
    bool checkBoxValue = true ;
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
                      Radio(value:  1, groupValue: radioIndex, onChanged: (v){
                          setState(() {
                              radioIndex = v ;
                          });
                      }),
                      Radio(value:  0, groupValue:radioIndex, onChanged: (v){
                          setState(() {
                              radioIndex = v ;
                          });
                      }),
                      Checkbox(value: checkBoxValue, onChanged: (v){
                          setState(() {
                            checkBoxValue = v;
                          });
                      }),
                      ListTile(
                          title: Text("ListTile title"),
                          leading: Text("ListTile leading"),
                          trailing: Text("ListTile trailing"),
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
                      ),
                      IconButton( icon: Icon(Icons.add), onPressed: (){},),
                      DropdownButton<String>(
                          value: dropdownValue,
                          items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(value: "One", child: Text("One"),),
                              DropdownMenuItem(value: "Two", child: Text("Two"),),
                              DropdownMenuItem(value: "Three", child: Text("Three"),),
                              DropdownMenuItem(value: "Four", child: Text("Four"),),
                          ],
                          onChanged: (v){
                              setState(() {
                                  dropdownValue = v;
                              });
                          },
                      ),
                      PopupMenuButton(
                          icon: Icon( Icons.menu ),
                          onSelected: (v){

                          },
                          itemBuilder: (context){
                              return <PopupMenuEntry<String>>[
                                  PopupMenuItem(value:"One" , child: Text("One"),),
                                  PopupMenuItem(value:"Two" , child: Text("Two"),),
                                  PopupMenuItem(value:"Three" , child: Text("Three"),),
                                  PopupMenuItem(value:"Four" , child: Text("Four"),),
                              ];
                          },
                      ),
                      Chip(
                          avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(Icons.check),
                          ),
                          label: Text('Aaron Burr'),
                      ),
                      Icon(Icons.play_arrow),
                      Card(
                          child: Container(
                              alignment: Alignment.center,
                              height: 72,
                              width: 144,
                              child: Text("Card"),
                          ),
                      ),
                      CircularProgressIndicator(),
                      LinearProgressIndicator(),
                      DataTable(columns: <DataColumn>[
                          DataColumn(label: Text("id")),
                          DataColumn(label: Text("name"))
                      ], rows: <DataRow>[
                          DataRow(cells: <DataCell>[
                              DataCell(Text("1")),
                              DataCell(Text("李白"))
                          ]),
                          DataRow(cells: <DataCell>[
                              DataCell(Text("2")),
                              DataCell(Text("杜甫"))
                          ]),
                          DataRow(cells: <DataCell>[
                              DataCell(Text("3")),
                              DataCell(Text("白居易"))
                          ])
                      ]),
                      Tooltip(child: RaisedButton(child: Text("Tooltip"), onPressed: (){},), message: "This is message of tooltip.",)
                  ],
              ),
          );
      } else
          return Text("This is Tab$selectedTabIndex");

  }

}