import 'package:eczane/models/Medicine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MedicineCards extends StatefulWidget {
  @override
  _MedicineCardsState createState() => _MedicineCardsState();
}

class _MedicineCardsState extends State<MedicineCards> {

  @override
  Widget build(BuildContext context) {


    final  medicenee = Provider.of<List<Medicine>>(context);

    print('l ${medicenee.length}');//test
    medicenee.forEach((d){
      print('n ${d.name}');


    });//iii

    return ListView.builder(
      itemCount:medicenee.length ,
        itemBuilder: (context, index) {


          return Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: Card(
              margin: EdgeInsets.fromLTRB(20  , 6, 20,0 ),
              child:ListTile(
                leading: CircleAvatar
                  (
                  radius: 25,
                  backgroundColor: Colors.green[100],

                ),
                title: Text(medicenee[index].name),
                subtitle: Text('sell price is  ${medicenee[index].price} Dinar'),


              ),


            ),
          );


        }

    );











  }
}
