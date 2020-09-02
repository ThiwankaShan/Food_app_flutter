import 'package:flutter/material.dart';
import 'package:food_app_frontend/Services/Auth/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Authservice().handleAuth();
  }
}
