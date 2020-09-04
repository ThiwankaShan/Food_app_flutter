import 'package:flutter/material.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';

class CustomerWrapper extends StatefulWidget {
  @override
  _CustomerWrapperState createState() => _CustomerWrapperState();
}

class _CustomerWrapperState extends State<CustomerWrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Router.customerHome,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
    );
  }
}
