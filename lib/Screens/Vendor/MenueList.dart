import 'package:flutter/material.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';
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
  List isSwitched = new List();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Stack(
                children: <Widget>[
                  FutureBuilder(
                      future:
                          VendorServices().getMenue(widget.user.data['uid']),
                      builder: (context, docsnapshot) {
                        if (docsnapshot.hasData) {
                          return Container(
                            color: Colors.white,
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 0.0,
                                ),
                                itemCount: docsnapshot.data.length,
                                itemBuilder: (context, index) {
                                  var item = docsnapshot.data[index].data;
                                  isSwitched.add(item['availability']);
                                  return Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      elevation: 10.0,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Container(
                                                  width: 150.0,
                                                  height: 85.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(30),
                                                      topRight:
                                                          Radius.circular(30),
                                                    ),
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          'images/burger.jpg'),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                item['itemName'],
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w800),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text("Price " +
                                                  item['price'].toString()),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Switch(
                                                activeColor: Colors.green,
                                                inactiveThumbColor: Colors.red,
                                                value: isSwitched[index],
                                                onChanged: (value) {
                                                  setState(() {
                                                    isSwitched[index] = value;
                                                    VendorServices()
                                                        .changeStatus(
                                                            widget.user
                                                                .data['uid'],
                                                            item['itemName'],
                                                            value);
                                                  });
                                                },
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: FloatingActionButton(
                          onPressed: () {
                            Router.navigator.pushNamed(Router.newItem,
                                arguments: NewItemArguments(
                                  user: widget.user,
                                ));
                          },
                          child: Icon(
                            Icons.add_circle,
                            size: 55,
                          )),
                    ),
                  )
                ],
              )),
        ));
  }
}
