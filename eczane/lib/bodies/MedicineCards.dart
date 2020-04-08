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
          child:
          return Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: Card(

              child: Container(
                  height: 50,
                  child: Center(child: Text(medicenee[index].name))),



            ),
          );
        }

    );











  }
}
