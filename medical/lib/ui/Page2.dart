import 'package:flutter/material.dart';

import 'Page1.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {




  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text("Medical")),
      ),
      backgroundColor: Colors.amber,
      body: Container(
        child: new Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                          height: 200, child: Image.asset("images/logo.png"))),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(


                     validator: (value) {
                        if (value.isEmpty)
                          return "please enter your name";
                        else
                          print("All is Good");
                      },









                      decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Name",
                          icon: new Icon(Icons.perm_identity),


                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(10.3))


                      ),
                    )),



                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "please enter the pharmacy name";
                        else
                          print("All is Good");
                      },
                      decoration: InputDecoration(
                          labelText: "pharmacyName",
                          hintText: "Pharmacy name",
                          icon: new Icon(Icons.business),
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3))),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "please enter a valid Email";
                        else
                          print("all is  good");
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          icon: new Icon(Icons.mail),
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3))),
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "please enter your password";
                        else
                          print("All is Good");
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          icon: new Icon(Icons.lock),
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3))),
                    )),




                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: RaisedButton(
                        child: new Text('Done'),
                        onPressed: () => {
                          if (_formKey.currentState.validate())
                            {
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                  content:
                                      Text("Cheick your mail for  the ID "))),
                              _formKey.currentState.reset()
                            }
                        },
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  alert() {}
}
