import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VendorServices {
  getOrders(uid) async {
    var ds = await Firestore.instance.collection('users').document(uid).get();
    var name = ds.data['name'];
    var doc = await Firestore.instance
        .collectionGroup('orders')
        .where('shop', isEqualTo: name)
        .getDocuments();

    return doc.documents;
  }

  showOrderlist() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var uid = snapshot.data.uid;
            return FutureBuilder(
                future: getOrders(uid),
                builder: (BuildContext context, ds) {
                  if (ds.hasData) {
                    return Expanded(
                        child: ListView.separated(
                            itemCount: ds.data.length,
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.black,
                              );
                            },
                            itemBuilder: (context, i) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(ds.data[i].data['item']),
                                  ),
                                  ListTile(
                                    title: Text(ds.data[i].data['ammount']),
                                  ),
                                ],
                              );
                            }));
                  } else {
                    return Text('loading');
                  }
                });
          } else {
            return Text('Loading');
          }
        });
  }

  storeNewitem(item) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('Menue')
        .document(item)
        .setData({'item': item, 'availability': true});
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
