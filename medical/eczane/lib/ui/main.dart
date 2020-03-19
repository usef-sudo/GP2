import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(splash());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(

          body: Stack(
            children: <Widget>[
              Image.asset(
                'images/r.jpg',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Center(

                child: new SplashScreen(

                    seconds: 5,
                    navigateAfterSeconds: MyApp(),

                    image: new Image.asset('images/splash.gif', fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,),
                    backgroundColor: Color.fromRGBO(61, 136, 221, 1),

                    photoSize: 180.0,
                    loadingText:Text('Welcome to Eczane',style: TextStyle(fontSize: 30), ) ,
                    loaderColor: Colors.white),
              ),
            ],

          ),
        ));
  }
}

class _MyAppState extends State<MyApp> {
  @override
  /*void initState()async {
    // TODO: implement initState
    super.initState();
    SharedPreferences prefs = await SharedPreferences.getInstance();

  }*/
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

            child: Container(
              color: Color.fromRGBO(222, 234, 247, 1),
              child: ListView(

          children: <Widget>[
              Container(
                  height: 50,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                    color: Color.fromRGBO(66  ,160, 206, 1),
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
                          onChanged: (newValue) {
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
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          onChanged: (newValue) {
                            print(newValue);

                            setState(() {
                              dropdownValue2 = newValue;
                            });
                          },
                          items: <String>['Normal', 'Dark', 'light']
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
                        child: InkWell(
                          child: new Icon(Icons.info),
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: new Icon(Icons.videocam),
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
          ],
        ),
            )),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
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
        backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back

        body: Page1(),
        //Center(child: new Image.asset("images/ph.png"))
      ),
    );
  }
}
