import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'MyDrawer.dart';


class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {



  String result = "Hey there !";

  Future _scan() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
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
    } */catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.amber,
        title: new Text("Sell"),
      ),
      drawer:MyDrawer(),


      body:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'you Scaned:',
            ),
            Text(
              result,

            ),
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'scan',
        child: Icon(Icons.settings_overscan),
      ),

    );
  }
}
