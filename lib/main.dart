import 'package:flutter/material.dart';
import 'package:food_app_frontend/Customer/CustomerHome.dart';
import 'package:food_app_frontend/Customer/ItemDetails.dart';
import 'package:food_app_frontend/Customer/MenueList.dart';
import 'package:food_app_frontend/Customer/ShoppingCart.dart';
import 'package:food_app_frontend/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ItemDetails();
  }
}
