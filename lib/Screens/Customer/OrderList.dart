import 'package:flutter/material.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Services/Customer/CustomerServices.dart';

class OrderList extends StatefulWidget {
  final user;
  const OrderList({@required this.user});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List cart = new List();
  String groupName = 'null';
  bool group_flag = false;
  bool cancel_flag = true;
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
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  shrinkWrap: true,
                                  itemCount: docsnapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var order = docsnapshot.data[index].data;

                                    if (groupName == order['shop']) {
                                      group_flag = false;
                                    } else {
                                      groupName = order['shop'];
                                      group_flag = true;
                                    }

                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        children: [
                                          group_flag
                                              ? Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0)),
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                                  child: Text(
                                                    order['shop'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                              : Container(),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            elevation: 10.0,
                                            child: Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Container(
                                                        width: 130.0,
                                                        height: 145.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    30),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    30),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          image:
                                                              DecorationImage(
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.5),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                child: Text(
                                                                  order[
                                                                      "status"],
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
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Text("Cost " +
                                                                order["cost"]
                                                                    .toString()),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Text(order["shop"])
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            RaisedButton(
                                                                child: Text(
                                                                    'Cancel Order'),
                                                                color:
                                                                    Colors.red,
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (order[
                                                                            'status'] ==
                                                                        'deliverd') {
                                                                      CustomerService().cancelOrder(
                                                                          widget.user.data[
                                                                              'uid'],
                                                                          docsnapshot
                                                                              .data[index]
                                                                              .documentID);
                                                                    } else {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'alert'),
                                                                      );
                                                                    }
                                                                  });
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
                                        ],
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
