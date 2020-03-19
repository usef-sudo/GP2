import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class MyMedicine extends StatefulWidget {
  @override
  _MyMedicineState createState() => _MyMedicineState();
}

class _MyMedicineState extends State<MyMedicine> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("MyMedicine"),
      ),
      drawer:MyDrawer(),


      body:Text("MyMedicine"),

    );
  }
}
