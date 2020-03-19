import 'package:flutter/material.dart';

import 'MyDrawer.dart';
class MedicineStore extends StatefulWidget {
  @override
  _MedicineStoreState createState() => _MedicineStoreState();
}

class _MedicineStoreState extends State<MedicineStore> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("MedicineStore"),
      ),
      drawer:MyDrawer(),


      body:Text("MedicineStore"),

    );
  }
}
