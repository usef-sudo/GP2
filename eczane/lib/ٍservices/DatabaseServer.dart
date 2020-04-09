import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eczane/models/Employee.dart';
import 'package:eczane/models/Medicine.dart';
import 'package:eczane/models/Store.dart';
import 'package:eczane/models/User.dart';

import 'package:eczane/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseServer {
    String uid;

  DatabaseServer({this.uid});

  final CollectionReference data = Firestore.instance.collection('data');

  Future updatedata(String name, String pharmacy) async {
    return await data.document(uid).setData({
      'name': name,
      'PharmacyName': pharmacy,
    });
  }

  Future addStore(String name, String phone) async {
    return await data.document(uid).setData({
      'name': name,
      'phon': phone,
    });
  }

  Future addEmployee(String admin, String name, String phone) async {
    return await data.document(admin).collection('employee').add({
      'email': name,
      'pass': phone,
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
/*
 Store _fromsnap(DocumentSnapshot snapshot){
    return Store(


    name: snapshot.data['name'],              ///////////////////ااااااااااااااااااااااااااااااااا اففففففففففففففففففففففففففففففففففففففففففففففف          ااااااااااااااااااااااااااااااااااااااااااااااا   ففففففففففففففففففففففففففففا

    phone: snapshot.data['phone'],


    );
  }
*/


  List<Medicine> _medicinelist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Medicine(
          quantity: doc.data['quntatity'] ?? '',
          profits: doc.data['profits'] ?? '',
          price: doc.data['price'] ?? '0',
          ID: doc.data['ID'] ?? '',
          Exp: doc.data['EXP'],
          name: doc.data['name'] ?? '');
    }).toList();
  }

  List<Store> _storelist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Store(
          name: doc.data['name'] ?? '', phone: doc.data['phone'] ?? '0');
    }).toList();
  }

  Stream<List<Store>> get stores {
    return data
        .document('stAU9AYvtCcGoaRbsMwIhU3C5Yi1')
        .collection('store')
        .snapshots()
        .map(_storelist);
  }
  ///////////////////////////////////////////////////////////////////////////////

  List<MEmployee> _emplist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return MEmployee(
          pass: doc.data['pass'] ?? '0', email: doc.data['email'] ?? '');
    }).toList();
  }

  Stream<List<MEmployee>> get emploies {
    return data
        .document('stAU9AYvtCcGoaRbsMwIhU3C5Yi1')
        .collection('employee')
        .snapshots()
        .map(_emplist);
  }

  ///////////////////////////////////////////////////////////////////////////////
  Stream<List<Medicine>> get medicines {
    return data
        .document('stAU9AYvtCcGoaRbsMwIhU3C5Yi1')
        .collection('medicines')
        .snapshots()
        .map(_medicinelist);
  }

/*
  // get user doc stream
  Stream <Store> get store{
    return data.document((uid)).snapshots()
        .map(_fromsnap);
  }
//
*/
}
//stAU9AYvtCcGoaRbsMwIhU3C5Yi1
