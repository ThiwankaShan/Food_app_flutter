import 'package:flutter/material.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      height: 400,
                      child: ListView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Card(
                                elevation: 10.0,
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage('images/food.jpg'),
                                          width: 100.0,
                                          height: 150.0,
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                    'details\nsomething\nsomething')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text('open'),
                                                Text('delivery')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                RaisedButton(
                                                    child: Text('Menue'),
                                                    color: Colors.amber,
                                                    onPressed: () {})
                                              ],
                                            )
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
        ));
  }
}
