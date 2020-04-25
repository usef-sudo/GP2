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
import 'package:flutter_counter/flutter_counter.dart';
import 'package:provider/provider.dart';
import 'MyDrawer.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import '../bodies/cartcomponent.dart';

class Sell extends StatefulWidget {
  @override
  SellState createState() => SellState();
}

//thtfhfdgtrdg
class SellState extends State<Sell> {
  int total = 0;
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
                          (total).toString(),
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
                        Text(((int.parse(_cash.text) - total)).toString()),
                      ],
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();

                          _bye();

                          updateqantiti();

                          SetSoldMed();
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
  int x = 1;
  String qrResult;
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
                          getUserTaskList(_id.text);

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
      qrResult = await BarcodeScanner
          .scan(); ////////////////////////////////////////////////////////////////////////////////////
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
      quantity: 1,
      profits: "1",
      price: "10",
      ID: "12345679",
      Exp: "23/2",
      name: "dawa");
  static List<Medicine> s = new List<Medicine>();
  SetSoldMed()async {
      x=0;
      bool flag;
    l.forEach((i) async {


      Medicine post = new Medicine(
         // quantity:i.quantity, name: i.name, profits:  i.profits ,ID: i.ID );
         quantity: defaultValue[x], name: i.name, profits:" ${ int.parse(i.profits)*defaultValue[x] }",ID: i.ID );


      Map<String, dynamic> postData = post.toJson();



      DocumentSnapshot snapshot = await Firestore.instance
          .collection('data')
          .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
          .collection('SoldMed')
          .document(i.ID)
          .get();

      Medicine obj = new Medicine(
          quantity: snapshot["quantity"]+postData["quantity"],
          profits: snapshot["profits"]+postData["profits"],
          );

      Map<String, dynamic> dada = obj.toJson();


 Firestore.instance
    .collection('data')
    .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
    .collection('SoldMed').getDocuments().then((snapshot){

      snapshot.documents.forEach((f)async{
      if(f.data.keys==i.ID)

  flag=true;


      });



});





if(false) {
  Firestore.instance
      .collection('data')
      .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
      .collection('SoldMed')
      .document(i.ID)
      .updateData(dada);
}
        //  {  "QTY":post.quantity/*+obj.quantity*/,"Profit":"${int.parse(post.profits)/*+int.parse(obj.profits)*/}",});}
      else{
      Firestore.instance
          .collection('data')
          .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
          .collection('SoldMed')
          .document(i.ID)
          .setData(postData);}










      x++;
    });
  }



  updateqantiti() async {
//cvLM57EPwYeYoiOGycxHF6WyWlC2   iEB5rRlXZpdEfwahBJNBCfATQci2
/**/

    t = 0;

    l.forEach((i) {
      Firestore.instance
          .collection('data')
          .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
          .collection('medicines')
          .document(i.ID)
          .updateData({"quantity": i.quantity - defaultValue[t]});
      t++;
    });
  }

  getUserTaskList(String id) async {
//cvLM57EPwYeYoiOGycxHF6WyWlC2   iEB5rRlXZpdEfwahBJNBCfATQci2
/**/
    DocumentSnapshot snapshot = await Firestore.instance
        .collection('data')
        .document("cvLM57EPwYeYoiOGycxHF6WyWlC2")
        .collection('medicines')
        .document(id)
        .get();

    Medicine obj = new Medicine(
        quantity: snapshot["quantity"],
        profits: snapshot["profits"],
        price: snapshot["price"],
        ID: snapshot["ID"],
        Exp: snapshot["Exp"],
        name: snapshot["name"]);

    if (snapshot["quantity"] <= 0) {
      obj = new Medicine(
          quantity: snapshot["quantity"],
          profits: snapshot["profits"],
          price: snapshot["price"],
          ID: snapshot["ID"],
          Exp: snapshot["Exp"],
          name: "This product is not available for now");
      l.add(obj);
    } else {
      l.add(obj);
      total += (int.parse(obj.price));
    }
    /*
    total=0;

    l.forEach((i) {

      total+=(int.parse(i.price));

    });*/

/*
      DocumentSnapshot snapshot = await Firestore.instance.collection('data').document("cvLM57EPwYeYoiOGycxHF6WyWlC2").collection('medicines')
    .document(id).get();



      await Firestore.instance.collection('data').document("cvLM57EPwYeYoiOGycxHF6WyWlC2").collection('SellMdes')
          .document(id).setData({

              "name" : snapshot.data["name"] ,



      });
*/

//       r = await Firestore.instance
//        .collection('data')
//       .document(DatabaseServer.get("uu").toString()).collection('medicines')
//    .document(_id.text).get();

    //l.add(newMed);
    setState(() {});

    // print(r.data["name"]);
    //  print(r.data);
    //  print(r.toString());
    // print("بروووح عليييهااا....");

    /*return r.documents.map(
            (doc) => Medicine(
              ID: doc.data['ID'],
              name:  doc.data['name'],
              price:  doc.data['price'],
              Exp:  doc.data['Exp'],
              profits: doc.data['profits'],
              quantity: doc.data['quantity'],

           )
    ).toList();*/

    // List<Medicine> l =  DatabaseServer.get("haneen").medicinelist(r) ;
    // print(l.length);
    // print(l);
//       print('gaaaaaaaaaaaaaaaaaaaaaaaaaaaaaag');
//       print(r['name']);
//       print(r.data['name']);

    // l.add(r.data);
  }

  rest() {
    print('good');
    s = l;
    clear();
  }
/*
  main() async {
    l = await getUserTaskList();
    useTasklist(tasks); // yay, the list is here
  }
  */

  List<Medicine> l = new List<Medicine>();
  //DocumentSnapshot   r;
  @override
  void initState() {
    // l.add(m);
    //print(l.length);
    //print(l);
    super.initState();
  }

  num _counter = 0;
  var defaultValue = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];

  //var bb =defaultValue;
  //[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];

  final _controller = FabCircularMenuController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 189, 221, 1), //back

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(66, 160, 206, 1),
        title: new Text("Sell"),
        actions: <Widget>[
          Center(child: Text("reset all")),
          InkWell(child: Icon(Icons.refresh), onTap: () => rest()),
        ],
      ),
      drawer: MyDrawer(),

      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.55,

/*
            child:StreamBuilder(
              stream: Firestore.instance.collection('data').document("cvLM57EPwYeYoiOGycxHF6WyWlC2").collection("SellMeds")
                .snapshots() ,
              builder: (BuildContext context , AsyncSnapshot snapshot){

              if(!snapshot.hasData){
                return CupertinoActivityIndicator();
              }
              else
{
  print(snapshot.data.documents.length);
               return ListView.builder(

                 itemCount: snapshot.data.documents.length,
               itemBuilder: (_,index){
                    return Card(
                     child: Text(snapshot.data.documents[index].name),
                   );
                 },
               );
              }
              },
            )
*/
            child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (_, index) {
                return SizedBox(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        l[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "price=" +
                                      "\$${int.parse(l[index].price) * defaultValue[index]}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                /*
                                child: new Row(
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
                                //    new Text("${l[index].quantity}"),
                                    new Text("1"),
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

                                 */
                                child: Counter(
                                    initialValue: defaultValue[index],
                                    minValue: 0,
                                    maxValue: 100,
                                    step: 1,
                                    decimalPlaces: 0,
                                    color: Colors.blueGrey,
                                    onChanged: (value) {
                                      setState(() {
                                        if (defaultValue[index] < value)
                                          total += int.parse(l[index].price);

                                        if (defaultValue[index] > value)
                                          total -= int.parse(l[index].price);

                                        defaultValue[index] = value;
                                        print(defaultValue[index]);
                                      });
                                    }),
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2 - 16,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.black38)),
                    onPressed: () {
                      _scan();
                      getUserTaskList(qrResult);
                    },
                    label: Text(
                      "Scan Barcode",
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.settings_overscan,
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 2 - 16,
                    child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black38)),
                      onPressed: () async {
                        _EnterId();
                      },
                      label: Text(
                        "ADD Manuel",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.keyboard,
                        color: Colors.black,
                      ),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          /*
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

           */
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

  clear() {
    print('jod');
    l.clear();
    total = 0;
    defaultValue = [
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1
    ];
    setState(() {});
  }
}
/*

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


                      new IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
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
                            Icons.remove_circle_outline,
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


                ]

            ),

        ),
      ),
    );

}
*/
