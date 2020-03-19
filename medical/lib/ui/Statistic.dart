import 'package:flutter/material.dart';

import 'MyDrawer.dart';
class Statistic extends StatefulWidget {
  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("Statistic"),
      ),
      drawer:MyDrawer(),


      body:Text("Statistic"),

    );
  }
}
