import 'package:flutter/material.dart';
import 'package:food_app_frontend/Customer/CustomerHome.dart';
import 'package:tabbar/tabbar.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Material(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.black,
                controller: controller,
                tabs: [
                  Tab(child: Icon(Icons.ac_unit, color: Colors.black)),
                  Tab(child: Icon(Icons.shopping_basket, color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            CustomerHome(),
            Container(color: Colors.red),
          ],
        ),
      ),
    );
  }
}
