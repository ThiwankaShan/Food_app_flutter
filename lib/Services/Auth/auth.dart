import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app_frontend/Screens/Auth/SignIn.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Screens/Customer/CustomerWrapper.dart';

class Authservice {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        print(snapshot.connectionState);
        if (snapshot.hasData) {
          return FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection('users')
                .document(snapshot.data.uid)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshotrole) {
              if (snapshotrole.hasData) {
                DocumentSnapshot ds = snapshotrole.data;
                var role = ds.data['role'];
                if (role == 'vendor') {
                  return CustomerWrapper();
                } else {
                  return CustomerWrapper();
                }
              } else {
                return LoadingScreen();
              }
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        } else {
          return SignIn();
        }
      },
    );
  }

//Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

//SignIn
  signIn(AuthCredential authCreds, name) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user =
        (await _auth.signInWithCredential(authCreds)).user;
    storeNewUser(user, name);
  }

  signInWithOTP(smsCode, verId, name) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds, name);
  }

  storeNewUser(user, name) {
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData({'uid': user.uid, 'role': 'user', 'name': name});
  }
}
