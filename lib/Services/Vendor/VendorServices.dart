import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VendorServices {
  getOrders(name) async {
    var doc = await Firestore.instance
        .collectionGroup('orders')
        .where('shop', isEqualTo: name)
        .getDocuments();

    return doc.documents;
  }

  storeNewitem(item, price) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('Menu')
        .document(item)
        .setData({'itemName': item, 'price': price, 'availability': true});
  }

  Future getmenue(uid) async {
    var docs = await Firestore.instance
        .collection('users')
        .document(uid)
        .collection('Menu')
        .getDocuments();
    return docs.documents;
  }

  Widget showItemslist() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: getmenue(snapshot),
                builder: (context, docsnapshot) {
                  if (docsnapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: docsnapshot.data.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Text(docsnapshot.data[i].data['item']),
                              );
                            }));
                  } else {
                    return Text('Loading');
                  }
                });
          } else {
            return Text('Loading');
          }
        });
  }
}
