import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/models/Store.dart';
import 'package:eczane/models/Store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eczane/models/Store.dart';

class StoreCards extends StatefulWidget {
  @override
  _StoreCardsState createState() => _StoreCardsState();
}

class _StoreCardsState extends State<StoreCards> {
  @override
  Widget build(BuildContext context) {
    _launchCaller(String num) async {
      String url = "tel:${num}";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final Storee = Provider.of<List<Store>>(context);


    print('l ${Storee.length}'); //test
    Storee.forEach((d) {
      print('n ${d.name}');
    }); //iiiiiiiiiiiiiiiiiiiiiiiiitest

    return ListView.builder(
      itemCount: Storee.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            color: null,
            margin: EdgeInsets.fromLTRB(6, 4, 6, 0),
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
                      Storee[index].name, //name only
                      style: TextStyle(color: Colors.black, fontSize: 30.0),
                    ),
                  ),
                  new FlatButton(
                      color: Colors.green,
                      onPressed: () =>
                          _launchCaller(Storee[index].phone), //phone only
                      child: new Text("Call ")),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
