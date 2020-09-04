import 'package:flutter/material.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';
import 'package:food_app_frontend/Screens/Customer/ShopList.dart';
import 'package:tabbar/tabbar.dart';

class CustomerHome extends StatefulWidget {
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final primaryColor = Color.fromRGBO(13, 71, 161, 1);
  final fontColor = Colors.grey[800];
  final secondryColor = Color.fromRGBO(253, 216, 53, 1);

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Router.navigator.pushNamed(Router.shoppingCart);
            },
          )
        ],
        backgroundColor: primaryColor,
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
                Tab(
                    child: Text(
                  'Shops',
                  style: TextStyle(color: fontColor, fontSize: 20.0),
                )),
                Tab(
                    child: Text('Orders',
                        style: TextStyle(color: fontColor, fontSize: 20.0))),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ShopList(),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
