import 'package:flutter/material.dart';
import 'package:medical/ui/Page2.dart';
import 'package:medical/utils/DatabaseHelper.dart';

import 'MyDrawer.dart';
import 'Page1.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context)  {






    return Scaffold(

      
      appBar: AppBar(


         backgroundColor: Colors.amber,
        title: new Text("Home"),
      ),
      drawer:MyDrawer(),


      body:Text("home"),

      );


  }
}

