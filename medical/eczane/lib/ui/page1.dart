import 'package:flutter/material.dart';

import 'Home.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
        backgroundColor: Color.fromRGBO(123, 189, 221, 1),
        //  backgroundColor: Color.fromRGBO(222, 234, 247, 1),
        body: Stack(
          children: <Widget>[
            /*  Image.asset(
              'images/m.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),*/
            new Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                        child: Container(
                            height: 150,
                            child: Image.asset("images/logo.png"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.7),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return "please enter a valid Id";
                              else
                                print("All is Good");
                            },
                            decoration: InputDecoration(
                              labelText: "ID",
                              // hintText: "ID",
                              icon: new Icon(Icons.perm_identity),
                              border: InputBorder.none,
                              /*  border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),*/
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(

                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.7),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return "please enter your passworld";
                              else
                                print("All is Good");
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              // hintText: "ID",
                              icon: new Icon(Icons.lock),
                              border: InputBorder.none,
                              /*  border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),*/
                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              child: new Text('Login'),
                              onPressed: () => {
                                if (_formKey.currentState.validate())
                                  {
                                    Scaffold.of(context).showSnackBar(
                                        SnackBar(content: new Text("Welcome"))),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home())),
                                    _formKey.currentState.reset()
                                  },
                              },
                              color: Colors.white,
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.black38)),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.black38)),
                              onPressed: () {
                                _formKey.currentState.reset();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Page2()),
                                );
                              },
                              child: new Text('Sign up'),
                              color: Colors.white,
                              textColor: Colors.black,
                            ),
                          ]),
                    ),
                  ),
                ]))),
          ],
        ));
  }
}
