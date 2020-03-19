import 'package:flutter/material.dart';
import 'MyDrawer.dart';
import 'dart:math' as math;
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var data = _generateRandomData(24);
  var data2 = _generateRandomData(7);
  var data3 = _generateRandomData(30);

  void _Details(var d) {
    result = d;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back
        appBar: AppBar(

          backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
          title: new Text("Statistics"),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
              width: 350.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Daily:',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    InkWell(

                      child: Card(
                        child: Container(

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Weekly:',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        child: new Container(

                          width: MediaQuery.of(context).size.width,
                     //   height: double.infinity,
                          child: new Sparkline(
                            data: data2,
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
                        _Details(data2);
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Monthly:',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                    InkWell(
                      
                      child: Card(
                        child: Container(

                          width: MediaQuery.of(context).size.width,

                          child: new Sparkline(
                            data: data3,
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
                        _Details(data3);
                      }),
                    ),
                    RaisedButton(
                        onPressed: () => f = true, child: Text('Show details'),
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black38)),
                    ),
                    if (result.toString() != data3.toString() || f)
                      new Text(result.toString()),
                  ],
                ),
              )),
        ));
  }
}
