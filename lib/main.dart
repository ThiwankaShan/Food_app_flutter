import 'package:flutter/material.dart';
import 'package:food_app_frontend/Routers/Router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ModularRouter.mainWrapper,
      onGenerateRoute: ModularRouter.onGenerateRoute,
      navigatorKey: ModularRouter.navigatorKey,
    );
  }
}
