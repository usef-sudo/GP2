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

  static DatabaseServer instance;


  static DatabaseServer get(var uu) {
    if (instance == null) {
      instance = DatabaseServer(uu);
    }
    return instance;
  }

  static DatabaseServer set() {
    instance = null;
  }

  DatabaseServer(this.uid);

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

  List<Medicine> medicinelist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Medicine(
          quantity: doc.data['quantity'] ?? '',
          profits: doc.data['profits'] ?? '',
          price: doc.data['price'] ?? '0',
          ID: doc.data['ID'] ?? '',
          Exp: doc.data['Exp'] ?? 'unknow',
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

   // return data.document("iEB5rRlXZpdEfwahBJNBCfATQci2").collection('store').snapshots().map(_storelist);
    return data.document(uid).collection('store').snapshots().map(_storelist);
  }
  ///////////////////////////////////////////////////////////////////////////////

  List<MEmployee> _emplist(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return MEmployee(
          pass: doc.data['pass'] ?? '0', email: doc.data['email'] ?? '');
    }).toList();
  }

  Stream<List<MEmployee>> get emploies {
    return data.document(uid).collection('employee').snapshots().map(_emplist);
  }

  ///////////////////////////////////////////////////////////////////////////////
  //
  // ///////////////////////////////////////////////////////////////////////////

  List<Medicine> _sold(QuerySnapshot snap) {
    return snap.documents.map((doc) {
      return Medicine(quantity: doc.data['quantity'] ?? '',
          profits: doc.data['profits'] ?? '',
          price: doc.data['price'] ?? '0',
          ID: doc.data['ID'] ?? '',
          Exp: doc.data['Exp'] ?? 'unknow',
          name: doc.data['name'] ?? '');
    }).toList();
  }

  Stream<List<Medicine>> get sold {
    //return data.document("cvLM57EPwYeYoiOGycxHF6WyWlC2").collection('SoldMed').snapshots().map(_sold);
    return data.document(uid).collection('SoldMed').snapshots().map(_sold);
  }

  ///////////////////////////////////////////////////////////////////////////////


  Stream<List<Medicine>> get medicines {
    return data
        .document(uid)
        .collection('medicines')
        .snapshots()
        .map(medicinelist);
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
//o0l8mtWKTWRQ75JZy3aguUbX0do1
