import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/%D9%8Dservices/auth.dart';
import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController _emppass = TextEditingController();
  TextEditingController _Email = TextEditingController();
  TextEditingController _ID = TextEditingController();
  Future _EnterEmployee() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white.withOpacity(0.80),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // SCAPE CARACTER INSERT ;'
                      ' Enter employee\'s password ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: InputBorder.none,
                      ),
                      controller: _emppass,
                    ),
                    Text(
                      ' Enter employee\'s  Email ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'email',
                        border: InputBorder.none,
                      ),
                      controller: _Email,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              getemployee();
                              setState(() {});

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF1BC0C5),
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                          child: RaisedButton(
                            onPressed: () {

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF1BC0C5),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        });
  }

  Future _RemoveEmployee() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white.withOpacity(0.80),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Enter employee\'s  ID ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'id',
                        border: InputBorder.none,
                      ),
                      controller: _ID,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {});

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF1BC0C5),
                          ),
                        ),
                        SizedBox(
                          width: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: const Color(0xFF1BC0C5),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        });
  }

  final authser _auth = authser();
  getemployee () async {


    await _auth.registemployee(_Email.text, _emppass.text);





    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(66  ,160, 206, 1),//up
          title: new Text("Employee"),
        ),
        drawer: MyDrawer(),
        body:

           Card(
             shape: RoundedRectangleBorder(
                 borderRadius: new BorderRadius.circular(18.0),
                 side: BorderSide(color: Colors.black)),
             child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'name :',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  Expanded(
                    child: Text(
                      'yousef',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'ID:',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  Expanded(
                    child: new Text(
                      '201710444',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
          ),
           ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.green,
                onPressed: () {
                  _EnterEmployee();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.red,
                onPressed: () {
                  _RemoveEmployee();
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        ));
  }
}
