import 'package:flutter/material.dart';
import 'package:food_app_frontend/Services/Auth/auth.dart';

class MainWrapper extends StatefulWidget {
  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Authservice().handleAuth();
  }
}
