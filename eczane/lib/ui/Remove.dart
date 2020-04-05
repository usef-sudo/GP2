/*
import 'package:flutter/material.dart';

class Remove extends StatefulWidget {
  @override
  _RemoveState createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  TextEditingController IDcontroller = TextEditingController();
  TextEditingController QUcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 234, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Remove"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Medicine ID",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      controller: IDcontroller,
                      validator: (value) {
                        if (value.isEmpty)
                          return "please enter medicene ID";
                        else
                          print("All is Good");
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "please enter medicene Quantity";
                        else
                          print("All is Good");
                      },
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets. fromLTRB(2.0,40.0,8.0,8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 2,
                      child: FlatButton.icon(
                          color: Colors.indigo,
                          onPressed: (){}, icon: Icon(Icons.remove_circle), label: Text("Remove")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/