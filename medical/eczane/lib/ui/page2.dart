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
        backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
        title: Center(child: Text("Eczane")),
      ),
        backgroundColor: Color.fromRGBO(123, 189, 221, 1),
      body:Stack(

        children: <Widget>[
     /* Image.asset(
      'images/m.jpg',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
          */Container(
        child: new Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                          height: 150, child: Image.asset("images/logo.png"))),
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
                            return "please enter your name";
                          else
                            print("All is Good");
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                         // hintText: "Name",
                          icon: new Icon(Icons.perm_identity),
                          border: InputBorder.none,
                        ),
                      ),
    ),),),),

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
                            return "please enter the pharmacy name";
                          else
                            print("All is Good");
                        },
                        decoration: InputDecoration(
                          labelText: "pharmacy\'sName",
                         // hintText: "Pharmacy\'sName",
                          icon: new Icon(Icons.business),
                          border: InputBorder.none,
                        ),
                      ),),),
                    )),
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
                            return "please enter a valid Email";
                          else
                            print("all is  good");
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                         // hintText: "Email",
                          icon: new Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),),),
                    )),
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
                            return "please enter your password";
                          else
                            print("All is Good");
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                         // hintText: "Password",
                          icon: new Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                      ),),),
                    )),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.black38)),
                        child: new Text('Done'),
                        onPressed: () => {
                          if (_formKey.currentState.validate())
                            {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
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
      ],)
    );
  }

  alert() {}
}
