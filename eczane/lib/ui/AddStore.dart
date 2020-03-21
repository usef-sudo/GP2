import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyDrawer.dart';

class AddStore extends StatefulWidget {
  @override
  _AddStoreState createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  TextEditingController _store = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _Number = TextEditingController();
  Future _RemoveStore() async {
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
                      ' Enter Store Number ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'number',
                        border: InputBorder.none,
                      ),
                      controller: _Number,
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

  Future _EnterStore() async {
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
                      ' Enter store name ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'name',
                        border: InputBorder.none,
                      ),
                      controller: _store,
                    ),
                    Text(
                      ' Enter phone number ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'number',
                        border: InputBorder.none,
                      ),
                      controller: _phone,
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

  _launchCaller() async {
    const url = "tel:0797215306";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(66  ,160, 206, 1),//up
          title: new Text("AddStore"),
        ),
        drawer: MyDrawer(),
        body: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black)),


          child: Padding(

            padding: const EdgeInsets.all(8.0),
            child: Row(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'yousef',
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                ),
                new FlatButton(
                    color: Colors.green,
                    onPressed: () => _launchCaller(),
                    child: new Text("Call ")),
              ],
            ),
          ),
        ),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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
                  _EnterStore();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.red,
                onPressed: () {
                  _RemoveStore();
                },
                child: Icon(Icons.remove),
              )
            ],
          ),
        ));
  }
}
