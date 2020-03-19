import 'package:flutter/material.dart';
import 'Remove.dart';
import 'MyDrawer.dart';

class MedicineStore extends StatefulWidget {
  @override
  _MedicineStoreState createState() => _MedicineStoreState();
}

class _MedicineStoreState extends State<MedicineStore> {
  TextEditingController NAMEcontroller = TextEditingController();
  TextEditingController PRIcontroller = TextEditingController();
  TextEditingController Qcontroller = TextEditingController();
  TextEditingController IDcontroller = TextEditingController();
  TextEditingController EXcontroller = TextEditingController();
  TextEditingController PROcontroller = TextEditingController();
  TextEditingController _ID = TextEditingController();
  TextEditingController _Count = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  Future _ADD() async {
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(

                          ' Do you want to add this package ? ',
                          style: TextStyle(

                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  Future _REMOVE() async {
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
                      ' Enter product  ID ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'ID',
                        border: InputBorder.none,
                      ),
                      controller: _ID,
                    ),
                    Text(
                      ' Enter product quantity to remove ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'number',
                        border: InputBorder.none,
                      ),
                      controller: _Count,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 189, 221, 1),//back
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(66  ,160, 206, 1),
        title: new Text("MedicineStore"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Medicine Name:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: NAMEcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter medicine name";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'name',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: PRIcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter Price";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'price',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: Qcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter Quantity";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Qty',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ID:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: new TextFormField(
                          controller: IDcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter ID";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'ID'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Expiry Date:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: EXcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter Expiry date";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Date',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Profits:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(),
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.7),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: PROcontroller,
                          validator: (value) {
                            if (value.isEmpty)
                              return "please enter Profits";
                            else
                              print("All is Good");
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'profit'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 2 - 16,
                          child: RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.black38)),
                            onPressed: () {
                              _REMOVE();
                            },
                            label: Text("Remove", style: TextStyle(color: Colors.black),),
                            icon: Icon(Icons.remove_circle_outline,color: Colors.black,),
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 13,
                            width: MediaQuery.of(context).size.width / 2 - 16,
                            child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.black38)),
                              onPressed: () {
                                _ADD();
                              },
                              label: Text("ADD", style: TextStyle(color: Colors.black),),
                              icon: Icon(Icons.add_circle_outline,color: Colors.black,),
                              color:Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
