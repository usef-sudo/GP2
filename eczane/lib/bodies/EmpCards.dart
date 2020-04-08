import 'package:eczane/models/Employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class EmpCards extends StatefulWidget {
  @override
  _EmpCardsState createState() => _EmpCardsState();
}

class _EmpCardsState extends State<EmpCards> {
  @override
  Widget build(BuildContext context) {




    final employ = Provider.of<List<MEmployee>>(context);


    return ListView.builder(
        itemCount: employ.length,
        itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.only(top:8.0),
    child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Email: ',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              Expanded(
                child: Text(
                 employ[index].email,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Text(
                'Password:',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              Expanded(
                child: new Text(
               employ[index].pass,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
    );
}


}
