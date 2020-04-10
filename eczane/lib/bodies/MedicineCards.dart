import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/models/Medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MedicineCards extends StatefulWidget {
  @override
  _MedicineCardsState createState() => _MedicineCardsState();
}

class _MedicineCardsState extends State<MedicineCards> {




  done(int x,od) async{
    final FirebaseAuth _auth=FirebaseAuth.instance;
    FirebaseUser _result =  await _auth.currentUser();

    Firestore.instance.collection('data').document(_result.uid).collection('medicines').document(od)
        .updateData({'quantity':(x-int.parse(next))});

    setState(() {

    });
  }


  TextEditingController _Count = TextEditingController();
  String next = "";


  @override
  void initState() {
    super.initState();
    //getMeds();
  }


  @override
  Widget build(BuildContext context) {
    List<Medicine> medicenee = Provider.of<List<Medicine>>(context);

    print('l ${medicenee.length}');//test
      medicenee.forEach((d){
      print('n ${d.name}');
      print('p ${d.price}');
      print('e ${d.Exp}');
      print('p ${d.profits}');
      print('i ${d.ID}');
      print('q ${d.quantity}');
    });//iii





    return ListView.builder(
      itemCount:medicenee.length ,
        itemBuilder: (context, index) {


          return Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: InkWell(
              child: Card(

                margin: EdgeInsets.fromLTRB(10  , 6, 10,0 ),
                child:ListTile(
                  leading: CircleAvatar
                    (
                    child:Text( medicenee[index].quantity.toString()),
                    radius: 25,

                    backgroundColor: Colors.green[medicenee[index].quantity%9*100],

                  ),
                  title: Text(medicenee[index].name),
                  subtitle: Text('sell price is  ${medicenee[index].price} Dinar'),


                ),


              ),
              onTap: (){

                INFO(medicenee[index].Exp, medicenee[index].quantity,medicenee[index].ID);
              },
            ),
          );


        }

    );











  }

  void INFO(String date,int q,String od) {

    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return Dialog(

        backgroundColor: Colors.white.withOpacity(0.80),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
    child: Container( height: 150,width: 100,

    child: Column( children: <Widget>[
SizedBox( height: 30,),
      Center(child: Text('this product is valid tell ${date}')),
      Divider(),
      SizedBox(
        width: 100.0,
        child: RaisedButton(
          onPressed: () {Navigator.of(context).pop();
            UpdateCard(q,od);

            setState(() {});


          },
          child: Text(
            "Update!",
            style: TextStyle(color: Colors.white),
          ),
          color: const Color(0xFF1BC0C5),
        ),
      ),

    ],


      ),
    )


     );}
      );
    }

    void UpdateCard(int q,String od){


      showDialog(
          context: context,
          builder: (BuildContext context)
          {
            return Dialog(




      backgroundColor: Colors.white.withOpacity(0.80),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)),
      child: Container( height: 200,width: 350,

      child: Center(
        child: Column( children: <Widget>[

SizedBox(height: 30,),
          Center(
            child: Text(
              '     Enter removed quantity  ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            onChanged: (val){
              setState(() {
                next=val;
              });

            },
            decoration: InputDecoration(
              hintText: '  number',
              border: InputBorder.none,
            ),
            controller: _Count,
          ),


          SizedBox(
            width: 100.0,
            child: RaisedButton(
              onPressed: () {

                done(q,od);

                setState(() {});

                Navigator.of(context).pop();
              },
              child: Text(
                "remove",
                style: TextStyle(color: Colors.white),
              ),
              color: const Color(0xFF1BC0C5),
            ),
          ),













        ],


        ),
      ),
      )


      );}
  );







    }

  }



