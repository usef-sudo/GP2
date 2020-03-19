import 'package:flutter/material.dart';
import 'package:medical/ui/Page2.dart';
import 'package:medical/ui/Page1.dart';
import 'package:medical/ui/Home.dart';
import 'package:medical/utils/DatabaseHelper.dart';

import 'User/User.dart';

void main() async {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String dropdownValue = 'English';
  String dropdownValue2 = 'Normal';
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        key: _scaffoldKey,
        endDrawer: new Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                    height: 50,
                    child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                        ))),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Languge'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: dropdownValue,

                            onChanged: ( newValue) {
                              print(newValue);

                              setState(() {
                                dropdownValue = newValue;
                              });

                            },
                            items: <String>['English', 'Arabic']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),

                        ),
                      ],
                    ),

                    Row(

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Theme'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Theme'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: dropdownValue2,

                            onChanged: ( newValue) {
                              print(newValue);

                              setState(() {
                                dropdownValue2 = newValue;
                              });

                            },
                            items: <String>['Normal','Dark', 'light']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),

                        ),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[



                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(child: new Icon(Icons.info),
                            onTap: (){},




                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(child: new Icon(Icons.videocam),
                          onTap: (){},),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(
              child: Text(
                "Eczane",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            )
          ],
        ),
        backgroundColor: Colors.amber,

        body: Page1(),
        //Center(child: new Image.asset("images/ph.png"))
      ),
    );
  }
}


