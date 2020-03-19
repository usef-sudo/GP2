import 'package:flutter/material.dart';

 import 'Home.dart';
import 'Page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.amber,
      body:
       new Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
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
                      return "please enter a valid Id";
                    else
                      print("All is Good");
                  },
                  decoration: InputDecoration(
                      labelText: "ID",
                      hintText: "ID",
                      icon: new Icon(Icons.perm_identity),
                      border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3))),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
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
                      hintText: "Password",
                      icon: new Icon(Icons.lock),
                      border: OutlineInputBorder(
                          gapPadding: 3.3,
                          borderRadius: BorderRadius.circular(3.3))),
                )),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: new Text('Login'),
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            Scaffold.of(context).showSnackBar(SnackBar( content:  new Text("Welcome"))),

          Navigator.push(context,

                                MaterialPageRoute(builder: (context) => Home())),
                            _formKey.currentState.reset()
                          },
                      },
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                    RaisedButton(
                      onPressed: () {
                        _formKey.currentState.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page2()),
                        );
                      },
                      child: new Text('Sighn up'),
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ]),
            ),
          ]))),
    );
  }
}
