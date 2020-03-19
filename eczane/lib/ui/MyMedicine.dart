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
      backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back

      appBar: AppBar(


        backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
        title: new Text("MyMedicine"),
      ),
      drawer:MyDrawer(),

       //********************************//To-DO//**********************************
      body:Text("MyMedicine"),

    );
  }
}
