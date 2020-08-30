import 'package:flutter/material.dart';

class MenueList extends StatefulWidget {
  @override
  _MenueListState createState() => _MenueListState();
}

class _MenueListState extends State<MenueList> {
  final primaryColor = Color.fromRGBO(13, 71, 161, 1);
  final fontColor = Colors.grey[800];
  final secondryColor = Color.fromRGBO(253, 216, 53, 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Food Menue'),
              backgroundColor: primaryColor,
              centerTitle: true,
            ),
            body: Container(
              color: primaryColor,
              child: Material(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                children: <Widget>[
                                  Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      elevation: 10.0,
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                  width: 130.0,
                                                  height: 145.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      bottomLeft:
                                                          Radius.circular(30),
                                                    ),
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          'images/food.jpg'),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        'Fried Rice\n',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text('Eat Art\n')
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Text('Cost  Rs 300')
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Column(
                                                        children: <Widget>[
                                                          ButtonTheme(
                                                            minWidth: 30.0,
                                                            height: 30.0,
                                                            child: RaisedButton(
                                                                elevation: 10.0,
                                                                child: Icon(Icons
                                                                    .remove),
                                                                onPressed:
                                                                    () {}),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text('3'),
                                                          ],
                                                        ),
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          ButtonTheme(
                                                            minWidth: 30.0,
                                                            height: 30.0,
                                                            child: RaisedButton(
                                                                elevation: 10.0,
                                                                child: Icon(
                                                                    Icons.add),
                                                                onPressed:
                                                                    () {}),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    )),
              ),
            )));
  }
}
