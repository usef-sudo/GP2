import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/models/Medicine.dart';
import 'package:eczane/ui/Sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyDrawer.dart';
import 'dart:math' as math;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/%D9%8Dservices/DatabaseServer.dart';
import 'package:eczane/%D9%8Dservices/auth.dart';
import 'package:eczane/models/Store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyDrawer.dart';
import 'package:eczane/bodies/StoreCards.dart';
import 'package:eczane/bodies/SoldCards.dart';
import 'package:provider/provider.dart';
bool f = false;
math.Random random = new math.Random();
List<double> result;
List<double> _generateRandomData(int count) {
  result = <double>[];
  result.clear();




  for (int i = 0; i < count; i++) {
    result.add((random.nextInt(100) + 0.0));
  }














  return result;
}

class statis extends StatefulWidget {
  @override
  _statisState createState() => _statisState();
}

class _statisState extends State<statis> {
  @override
  var data = _generateRandomData(24);/// not outo generate but get
  //var data2 = _generateRandomData(7);
  //var data3 = _generateRandomData(30);


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




@override
  void initState() {

    super.initState();
  }








  void _Details(var d) {
    //result = d;// show stream builder









  }

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<Medicine>>.value(
      value: DatabaseServer.instance.sold,
      child:  new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(123, 189, 221, 1), //back
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(66, 160, 206, 1),
          title: new Text("Statistics"),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          /* child: Container(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:*/

          child:SizedBox(
            height: 700,
            width: 500,

            child: Column(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Statistics:',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                InkWell(
                  child: Card(
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2,

                      width: MediaQuery.of(context).size.width,
                      // height: double.infinity,
                      child: new Sparkline(
                        data: data,
                        lineColor: Colors.black,
                        fillMode: FillMode.below,
                        fillColor: Colors.black12,
                        pointsMode: PointsMode.all,
                        pointSize: 5.0,
                        pointColor: Colors.red,
                      ),
                    ),
                  ),
                  onTap: () => setState(() {
                    _Details(data);
                  }),
                ),

                SingleChildScrollView(
                  child: Container(height: 420, child: SoldCards()),
                ),


              ],
            ),
          ),

          // )),
        )),
    );







  }
}
