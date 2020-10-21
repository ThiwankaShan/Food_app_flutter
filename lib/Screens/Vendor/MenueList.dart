import 'package:flutter/material.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Services/Vendor/VendorServices.dart';

class MenueList extends StatefulWidget {
  final user;
  const MenueList({@required this.user});
  @override
  _MenueListState createState() => _MenueListState();
}

class _MenueListState extends State<MenueList> {
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
                        future:
                            VendorServices().getmenue(widget.user.data['uid']),
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
                                    var item = docsnapshot.data[index].data;
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
                                                          item['itemName'],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Text("Price " +
                                                            item['price']
                                                                .toString()),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: <Widget>[
                                                        Text("Available")
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
