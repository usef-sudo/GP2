import 'package:eczane/models/Medicine.dart';
import 'package:flutter/cupertino.dart';
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
                margin: EdgeInsets.fromLTRB(20  , 6, 20,0 ),
                child:ListTile(
                  leading: CircleAvatar
                    (
                    child:Text( medicenee[index].quantity),
                    radius: 25,

                    backgroundColor: Colors.green[(int.parse(medicenee[index].quantity)%9)*100],

                  ),
                  title: Text(medicenee[index].name),
                  subtitle: Text('sell price is  ${medicenee[index].price} Dinar'),


                ),


              ),
              onTap: (){

                INFO(medicenee[index].Exp);
              },
            ),
          );


        }

    );











  }

  void INFO(String date) {

    showDialog(
        context: context,
        builder: (BuildContext context)
    {
      return Dialog(

        backgroundColor: Colors.white.withOpacity(0.80),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
    child: Container( height: 100,width: 100,
    child: Center(child: Text('this product is valid tell ${date}')),)
      );
    }
    );
  }



}