import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(240, 2, 154, 240),
      body: Container(
          padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 5.0),
          child: Column(
            children: <Widget>[
              Row(
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
                  )
                ],
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
                          width: 20.0,
                        ),
                        Icon(
                          Icons.local_pizza,
                          color: Color.fromARGB(240, 255, 224, 102),
                          size: 50.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.fastfood,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.local_pizza,
                          color: Color.fromARGB(240, 255, 224, 102),
                          size: 50.0,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(
                          Icons.fastfood,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey[800]),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                labelText: 'ex. Robert ',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey[800]),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                labelText: 'ex. +94 715867772 ',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: ButtonTheme(
                            height: 45.0,
                            minWidth: 300.0,
                            child: Material(
                              elevation: 15.0,
                              shadowColor: Colors.white,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Color.fromARGB(240, 255, 224, 102),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    ));
  }
}
