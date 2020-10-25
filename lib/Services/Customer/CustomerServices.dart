import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerService {
  Future getshops() async {
    var docs = await Firestore.instance
        .collection('users')
        .where('role', isEqualTo: 'vendor')
        .getDocuments();
    return docs.documents;
  }

  Future getmenue(shopID) async {
    var docs = await Firestore.instance
        .collection('users')
        .document(shopID)
        .collection('Menue')
        .getDocuments();
    return docs.documents;
  }

  cancelOrder(userID, docID) {
    Firestore.instance
        .collection('users')
        .document(userID)
        .collection('orders')
        .document(docID)
        .delete();
  }

  setorders(List list) async {
    var cost, ammount, item, shop;
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    for (var i = 0; i < list.length; i++) {
      item = list[i]['item'];
      ammount = list[i]['ammount'];
      cost = list[i]['cost'];
      shop = list[i]['shop'];

      Firestore.instance
          .collection('users')
          .document(user.uid)
          .collection('orders')
          .document()
          .setData({
        'item': item,
        'ammount': ammount,
        'cost': cost,
        'shop': shop,
        'status': 'placed',
      });
    }
  }

  viewOrders() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var docs = await Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('orders')
        .orderBy('shop')
        .getDocuments();
    return docs.documents;
  }
}
