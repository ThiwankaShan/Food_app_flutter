import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        .setData(
            {'itemName': item, 'price': price.hashCode, 'availability': true});
  }

  Future getmenue(uid) async {
    var docs = await Firestore.instance
        .collection('users')
        .document(uid)
        .collection('Menu')
        .getDocuments();
    return docs.documents;
  }
}
