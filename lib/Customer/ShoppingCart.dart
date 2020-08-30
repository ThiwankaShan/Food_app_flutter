import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final primaryColor = Color.fromRGBO(13, 71, 161, 1);
  final fontColor = Colors.grey[800];
  final secondryColor = Color.fromRGBO(253, 216, 53, 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Shopping Cart'),
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
                          child: Stack(children: [
                            Container(
                              color: Colors.white,
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                                    width: 100.0,
                                                    height: 100.0,
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
                                                            'images/burger.jpg'),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Text(
                                                        'Fried Rice',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                25.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                        child: IconButton(
                                                            icon: Icon(
                                                                Icons.delete),
                                                            color:
                                                                Colors.red[700],
                                                            onPressed: () {}),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text('From Eat Art')
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
                                                            buttonColor:
                                                                secondryColor,
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
                                                            buttonColor:
                                                                secondryColor,
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
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0.0,
                                                                  10.0,
                                                                  25.0,
                                                                  10.0),
                                                          child: Text(
                                                            'Rs 300',
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                color:
                                                                    primaryColor),
                                                          ))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                        ButtonTheme(
                          height: 45.0,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                            child: RaisedButton(
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: primaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Checkout',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {}),
                          ),
                        )
                      ],
                    )),
              ),
            )));
  }
}
