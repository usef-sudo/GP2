import 'package:flutter/material.dart';

import 'MyDrawer.dart';
class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("Employee"),
      ),
      drawer:MyDrawer(),


      body:Text("Employee"),

    );
  }
}
