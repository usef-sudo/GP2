import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/%D9%8Dservices/DatabaseServer.dart';
import 'package:eczane/bodies/StoreCards.dart';
import 'package:eczane/models/Medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:provider/provider.dart';
import 'MyDrawer.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import '../bodies/cartcomponent.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

//thtfhfdgtrdg
class _SellState extends State<Sell> {
  int total = 100;
  TextEditingController _id = TextEditingController();
  TextEditingController _cash = TextEditingController(text: '0');

//List<String> result = ['choose selling type'];
  Future _bye() async {
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
                    Row(
                      children: <Widget>[
                        Text(
                          'total price =',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          total.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Enter cash recived:'),
                    ),
                    TextField(
                      controller: _cash,
                      decoration: InputDecoration(
                        hintText: 'Cash Recived',
                        border: InputBorder.none,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('change: '),
                        Text((total - (int.parse(_cash.text))).toString()),
                      ],
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          _bye();
                        },
                        child: Text(
                          "calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // String result = "'choose different sell method',";
  int t = 1;

  Future _EnterId() async {
    if (t == 1)
      //result.removeAt(0);
      t++;
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
                      ' Enter ID ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'ID',
                        border: InputBorder.none,
                      ),
                      controller: _id,
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          // result.add(_id.text);

                          setState(() {});

                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future _scan() async {
    if (t == 1)
      // result.removeAt(0);
      t++;
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        // result.add(qrResult);
      });
    } /*on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } */
    catch (ex) {
      setState(() {
        //  result.add("Unknown Error $ex");
      });
    }
  }

//List<Medicine> litems = new List<Medicine>();
  Medicine m = new Medicine(
      quantity: 1, profits: "m", price: "k", ID: "j", Exp: "j", name: "kjh");
  List<Medicine> litems = new List<Medicine>();
  List<Medicine> l = new List<Medicine>();

  @override
  void initState() {
    l.add(m);
    litems.add(m);

    super.initState();
  }

  final _controller = FabCircularMenuController();
  Widget build(BuildContext context) {
    CollectionReference r = Firestore.instance
        .collection('data')
        .document("${DatabaseServer.get("uu")}")
        .collection('medicines');

    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 189, 221, 1), //back

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(66, 160, 206, 1),
        title: new Text("Sell"),
      ),
      drawer: MyDrawer(),

      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.65,
            child: new ListView.builder(
              itemCount: l.length,
              itemBuilder: (_, index) {
                return SizedBox(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(l[index].name),
                      subtitle: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                child: Text("price=" + "\$${l[index].price}"),
                              ),
                              Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    new IconButton(
                                        icon: Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          /* setState(() {

                              });*/
                                        }),
                                    new Text("${l[index].quantity}"),
                                    new IconButton(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          /*  setState(() {

                               });
                               */
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

//Text('Scan more:'),
          /*build((context) =>  cartproduct())
              Text(
                result,

              ),*/
          FabCircularMenu(
            fabColor: Colors.black,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.65,
                // color: Color.fromRGBO(222, 234, 247, 1),
                //
                //color: Colors.amberAccent,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 300.0),
                )),
              ),
            ),
            ringColor: Colors.black,
            controller: _controller,
            options: <Widget>[
              IconButton(
                  tooltip: 'test',
                  icon: Icon(Icons.widgets),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cartproduct()),
                    );
                  },
                  iconSize: 30.0,
                  color: Colors.white),
              IconButton(
                  tooltip: 'Scan ID',
                  icon: Icon(Icons.settings_overscan),
                  onPressed: () {
                    _scan();
                  },
                  iconSize: 40.0,
                  color: Colors.white),
              IconButton(
                  tooltip: 'Add manuel',
                  icon: Icon(Icons.keyboard),
                  onPressed: (() => {
                        _EnterId(),
                      }),
                  iconSize: 40.0,
                  color: Colors.white),
              //  IconButton(icon: Icon(Icons.done_outline), onPressed: () {_bye();}, iconSize: 40.0, color: Colors.black),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total   =',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(total.toString() + ' JD',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
            ),
            IconButton(
                icon: Icon(Icons.done_outline),
                onPressed: () {
                  _bye();
                },
                iconSize: 40.0,
                color: Colors.green),
          ],
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'scan',
        child: Icon(Icons.settings_overscan),
      ),*/
    );
  }
}

Widget HI(Medicine data) {
  return Container(
    color: Colors.black38,
    child: Card(
      child: ListTile(
        title: Text(data.name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: Text("price=" + "\$${data.price}"),
                ),
                Expanded(
                  child: new Column(
                    children: <Widget>[
                      new IconButton(
                          icon: Icon(
                            Icons.arrow_drop_up,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            data.quantity++;
                            /* setState(() {

                              });*/
                          }),
                      new Text("${data.quantity}"),
                      new IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            data.quantity--;
                            /*  setState(() {

                               });
                               */
                          }),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
