import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/models/User.dart';

import 'package:eczane/models/user.dart';

class DatabaseServer {
  final String uid;
  DatabaseServer({this.uid});
  final CollectionReference data = Firestore.instance.collection('data');
  final CollectionReference store = Firestore.instance.collection('store');
  final CollectionReference employee = Firestore.instance.collection('employee');
  final CollectionReference medicines = Firestore.instance.collection('medicines');

  Future updatedata(String name, String pharmacy) async {
    return await data.document(uid).setData({

      'name': name,
      'PharmacyName': pharmacy,

    });
  }

  Future addStore(String name, String phone) async {
    return await store.document(uid).setData({

      'name': name,
      'phon': phone,

    });
  }

  Future addEmployee(String name, String phone) async {
    return await employee.document(uid).setData({

      'name': name,
      'phon': phone,

    });
  }


/*
  // snapshot to listty my data type
  List<Brew> _brewlist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugar: doc.data['sugar'] ?? '0');
    }).toList();
  }
  */

  // user data from snap shot

 /*UserData _fromsnap(DocumentSnapshot snapshot){
    return UserData(

      uid:uid,
    name: snapshot.data['name'],              ///////////////////ااااااااااااااااااااااااااااااااا اففففففففففففففففففففففففففففففففففففففففففففففف          ااااااااااااااااااااااااااااااااااااااااااااااا   ففففففففففففففففففففففففففففا

    PharmacyName: snapshot.data['PharmacyName'],


    );
  }*/

/*
  // get stream
  Stream <List<User>> get dat {
    return data.snapshots()
        .map(_brewlist);
  }
*/

  // get user doc stream
  /*Stream <UserData> get userData{
    return data.document((uid)).snapshots()
        .map(_fromsnap);
  }*/


}
