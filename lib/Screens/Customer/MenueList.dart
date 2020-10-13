import 'package:flutter/material.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';
import 'package:food_app_frontend/Screens/loading.dart';
import 'package:food_app_frontend/Services/Customer/CustomerServices.dart';

class MenueList extends StatefulWidget {
  final String shopID;
  final shopName;
  final List cart;
  const MenueList({this.shopID, this.cart, this.shopName});
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Router.navigator.pushNamed(Router.shoppingCart,
                        arguments: ShoppingCartArguments(cart: widget.cart));
                  },
                )
              ],
              elevation: 0.0,
              title: Text('Food Menu'),
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
                          child: FutureBuilder(
                              future: CustomerService().getmenue(widget.shopID),
                              builder: (context, docsnapshot) {
                                if (docsnapshot.hasData) {
                                  return Container(
                                    color: Colors.white,
                                    child: GridView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0.0,
                                          mainAxisSpacing: 0.0,
                                        ),
                                        itemCount: docsnapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var item =
                                              docsnapshot.data[index].data;
                                          var itemName = docsnapshot
                                              .data[index].data['itemName'];
                                          return GestureDetector(
                                            onTap: () {
                                              Router.navigator.pushNamed(
                                                  Router.itemDetails,
                                                  arguments:
                                                      ItemDetailsArguments(
                                                          item: item,
                                                          shopID: widget.shopID,
                                                          shopName:
                                                              widget.shopName,
                                                          cart: widget.cart));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                              elevation: 10.0,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                          width: 150.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(30),
                                                              topRight: Radius
                                                                  .circular(30),
                                                            ),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage(
                                                                  'images/burger.jpg'),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          itemName + '\n',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
              ),
            )));
  }
}