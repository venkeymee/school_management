import 'package:flutter/material.dart';
 import 'package:hello_wordl/screens/home_screen.dart';
import 'package:hello_wordl/screens/login/login_screen.dart';
// import 'package:hello_wordl/screens/login/login_screen.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/':         (BuildContext context) => new HomeScreen(),
  //  '/' :          (BuildContext context) => new LoginScreen(),
};