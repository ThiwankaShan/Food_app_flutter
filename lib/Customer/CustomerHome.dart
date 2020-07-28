import 'package:flutter/material.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
          padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Text('section 1'),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
              Material(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Row(
                  children: <Widget>[
                    Text('section 2'),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
              Material(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Card(
                        elevation: 10.0,
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[Text('Image')],
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[Text('Name')],
                                ),
                                Row(
                                  children: <Widget>[Text('details')],
                                ),
                                Row(
                                  children: <Widget>[Text('open tag')],
                                ),
                                Row(
                                  children: <Widget>[Text('delivery')],
                                ),
                                Row(
                                  children: <Widget>[
                                    RaisedButton(
                                        color: Colors.amber, onPressed: () {})
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
