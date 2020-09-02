import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app_frontend/Services/Auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String phoneNo, verificationId, smsCode, name;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(240, 2, 154, 240),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 5.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Hello.\nWelcome foodie',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1.0,
                      height: 1.3),
                ),
                SizedBox(
                    height: 150,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.fastfood,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.local_pizza,
                            color: Color.fromARGB(240, 255, 224, 102),
                            size: 50.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.iceCream,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.drumstickBite,
                            color: Color.fromARGB(240, 255, 224, 102),
                            size: 50.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.cheese,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
                codeSent
                    ? Container(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: 'Enter OTP'),
                          onChanged: (val) {
                            setState(() {
                              this.smsCode = val;
                            });
                          },
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        this.name = value;
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(0),
                                        labelText: 'ex. Robert ',
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          this.phoneNo = '+94' + value;
                                        });
                                      },
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(0),
                                          labelText: 'ex. +94 715867772 ',
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: ButtonTheme(
                          height: 45.0,
                          minWidth: 300.0,
                          child: Material(
                            elevation: 10.0,
                            shadowColor: Colors.black,
                            child: RaisedButton(
                              onPressed: () {
                                codeSent
                                    ? Authservice().signInWithOTP(
                                        smsCode, verificationId, name)
                                    : verifyPhone(phoneNo);
                              },
                              color: Color.fromARGB(240, 255, 224, 102),
                              child: codeSent
                                  ? Text(
                                      'Verify',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800),
                                    )
                                  : Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    ));
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      Authservice().signIn(authResult, name);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
