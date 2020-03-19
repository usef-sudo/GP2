import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'MyDrawer.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import 'cartcomponent.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
int total=100;
TextEditingController _id= TextEditingController();
TextEditingController _cash= TextEditingController(text: '0');

List<String> result = ['choose selling type'];
Future _bye() async{
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.80),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20.0)), //this right here
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
                      Text('total price =' ,style: TextStyle(fontSize:20, ),),
                      Text(total.toString(),style: TextStyle(fontSize:20, ),),
                    ],
                  )
                 ,
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
                     Text( 'change: '),

                    Text((   total    -    (int.parse(_cash.text))     ).toString()),
                   ],
                 )
                ,
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
int t=1;

Future _EnterId() async{

  if(t==1)
    result.removeAt(0);
  t++;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white.withOpacity(0.80),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,

            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' Enter ID ',style: TextStyle(fontSize:20, ),),
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
                        String alert =_id.text;
                      result.add(alert);
                      setState(() {

                      });


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


    if(t==1)
    result.removeAt(0);
    t++;
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result.add(qrResult);
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
        result.add("Unknown Error $ex");
      });
    }
  }
  final _controller = FabCircularMenuController();
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back

      appBar: AppBar(


        backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
        title: new Text("Sell"),
      ),
      drawer:MyDrawer(),


      body:
     SingleChildScrollView(
       child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            /*  Text(
                'you Scaned:',
              ),
              Text(
                result,

              ),*/
              FabCircularMenu(
                fabColor: Colors.black,
                child: SingleChildScrollView(
                  child: Container(
                    height:  MediaQuery.of(context).size.height,
          // color: Color.fromRGBO(222, 234, 247, 1),
           //
                    //color: Colors.amberAccent,
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 442.0),
                          child:
                          Column(
                            children: <Widget>[
                              Text(
                                'you Scaned:',
                              ),
                              Text(
                                 "\r\n"+ result.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 30.0)
                              ),

                            ],
                          )






                        )
                    ),
                  ),
                ),
                ringColor: Colors.black,



                controller: _controller,
                options: <Widget>[
                  IconButton(tooltip: 'test',icon: Icon(Icons.widgets), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  cartproduct()),
                    );




                  }, iconSize: 30.0, color: Colors.white),
                  IconButton(tooltip: 'Scan ID',icon: Icon(Icons.settings_overscan), onPressed: () {_scan();}, iconSize: 40.0, color: Colors.white),
                  IconButton(tooltip: 'Add manuel',icon: Icon(Icons.keyboard), onPressed: () {_EnterId();}, iconSize: 40.0, color: Colors.white),
                //  IconButton(icon: Icon(Icons.done_outline), onPressed: () {_bye();}, iconSize: 40.0, color: Colors.black),
                   ],
              ),

            ],
          ),
     ),

    bottomNavigationBar: BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total   =', style:  TextStyle(color: Colors.black, fontSize: 20.0 ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(total.toString()+' JD',style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),

          IconButton(icon: Icon(Icons.done_outline), onPressed: () {_bye();}, iconSize: 40.0, color: Colors.green),

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
