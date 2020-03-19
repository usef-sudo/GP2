import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class AddStore extends StatefulWidget {
  @override
  _AddStoreState createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("AddStore"),
      ),
      drawer:MyDrawer(),


      body:Text("AddStore"),

    );
  }
}
