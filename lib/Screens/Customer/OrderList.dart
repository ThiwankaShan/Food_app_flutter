import 'package:flutter/material.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Services/Customer/CustomerServices.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';

class OrderList extends StatefulWidget {
  final user;
  const OrderList({@required this.user});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List cart = new List();
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
                    child: FutureBuilder(
                        future: CustomerService().viewOrders(),
                        builder: (context, docsnapshot) {
                          if (docsnapshot.hasData) {
                            return Container(
                              color: Colors.white,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  shrinkWrap: true,
                                  itemCount: docsnapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var order = docsnapshot.data[index].data;
                                    return Container(
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
                                                          order["item"]
                                                              ["itemName"],
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
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.5),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Text(
                                                              order["status"],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                        Text("Ammount " +
                                                            order["ammount"]
                                                                .toString())
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Text("Cost " +
                                                            order["cost"]
                                                                .toString()),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Text(order["shop"])
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        RaisedButton(
                                                            child:
                                                                Text('Remove'),
                                                            color: Colors.red,
                                                            onPressed: () {
                                                              setState(() {});
                                                            })
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else {
                            return LoadingScreen();
                          }
                        }),
                  )
                ],
              )),
        ));
  }
}
