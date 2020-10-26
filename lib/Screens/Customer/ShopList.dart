import 'package:flutter/material.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Services/Customer/CustomerServices.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';

class ShopList extends StatefulWidget {
  final cart;
  final user;
  const ShopList({@required this.user, this.cart});
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
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
                        future: CustomerService().getshops(),
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
                                    var shopName =
                                        docsnapshot.data[index].data['name'];
                                    var shopID =
                                        docsnapshot.data[index].data['uid'];
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
                                                          shopName,
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
                                                        Text(
                                                            '14 items in menue \n fresh food\n')
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
                                                              'open',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                        Text('delivery')
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        RaisedButton(
                                                            child:
                                                                Text('Menue'),
                                                            color: Colors.amber,
                                                            onPressed: () {
                                                              Router.navigator.pushNamed(
                                                                  Router
                                                                      .menueList,
                                                                  arguments: MenueListArguments(
                                                                      user: widget
                                                                          .user,
                                                                      shopID:
                                                                          shopID,
                                                                      shopName:
                                                                          shopName,
                                                                      cart: widget
                                                                          .cart));
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
