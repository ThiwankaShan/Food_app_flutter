import 'package:flutter/material.dart';
import 'package:food_app_frontend/Auth/SignIn.dart';
import 'package:food_app_frontend/Customer/CustomerHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomerHome();
  }
}
