import 'package:flutter/material.dart';
// import 'package:login_app/auth.dart';
import 'package:hello_wordl/routes.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      routes: routes,
    );
  }


}