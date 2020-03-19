import 'package:flutter/material.dart';
import 'Home.dart';
import 'Sell.dart';
import 'Refrences.dart';
import 'AddStore.dart';
import 'MyMedicine.dart';
import 'MedicineStore.dart';
import 'Statistic.dart';
import 'Employee.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      new Drawer(
        child: ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              // those account attripute must be returned from db.........
              accountName: Text('الراسم'),
              accountEmail: Text('salah@yahoo.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.red),
            ),

            //pages
            InkWell(
              onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context) => Home ()),);},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => Sell ()),);},
              child: ListTile(
                title: Text('Sell'),
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddStore ()),);

              },
              child: ListTile(
                title: Text('Add Store'),
                leading: Icon(Icons.add),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context) => MyMedicine ()),);},
              child: ListTile(
                title: Text('My Medecine'),
                leading: Icon(Icons.local_pharmacy),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new MedicineStore()));
              },
              child: ListTile(
                title: Text('Medecinr Store'),
                leading: Icon(
                  Icons.store,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context) => Statistic ()),);},
              child: ListTile(
                title: Text('Statistecs'),
                leading: Icon(Icons.insert_chart),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context) => Employee ()),);},
              child: ListTile(
                title: Text('Employee'),
                leading: Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      );



      /*
      Drawer(
      child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(

              // those account attripute must be returned from db.........

              accountName: Text('Yousef Alnajjar'),
              accountEmail: Text('Usef444@icloud.com'),
              currentAccountPicture:
                  Image.asset("images/logo.png"),
              decoration: BoxDecoration(color: Colors.amber),
            ),

//            DrawerHeader(
//              child: CircleAvatar(
//                radius: 3,
//                child: Text("Y"),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.orange,
//              ),
//

            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {

                 Navigator.push(context, MaterialPageRoute(builder: (context) => Home ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Sell'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sell ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Refrences'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Refrences ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Add Store'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddStore ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('My Medicine'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyMedicine ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Medicen Store'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineStore ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Statistics'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Statistic ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Employee'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Employee ()),);

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              title: Text('Soon'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ]),
    );*/
  }
}
