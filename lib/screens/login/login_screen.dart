import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:login_app/auth.dart';
// import 'package:login_app/data/database_helper.dart';
// import 'package:login_app/models/user.dart';
 import 'package:hello_wordl/screens/login/login_screen_presenter.dart';
import 'package:hello_wordl/services/login_screen_service.dart';
import 'package:hello_wordl/services/login_screen_service.dart' as prefix0;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> implements LoginScreenContract
     {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password,_username;
LoginScreenService _screenService;

  LoginScreenState() {
    _screenService = new LoginScreenService(this);
  //   var authStateProvider = new AuthStateProvider();
  //   authStateProvider.subscribe(this);
   }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
//      setState(() => _isLoading = true);
      form.save();
      _screenService.doLogin(_username, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  // @override
  // onAuthStateChanged(AuthState state) {
   
  //   if(state == AuthState.LOGGED_IN)
  //     Navigator.of(_ctx).pushReplacementNamed("/home");
  // }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("LOGIN"),
      color: Colors.lightBlue,
    );
    var loginForm = new Column(
      children: <Widget>[
        new Text(
          "School Managament ",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  validator: (val) {
                    return val.length < 10
                        ? "Username must have atleast 10 chars"
                        : null;
                  },
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              ),
            ],
          ),
        ),
        _isLoading ? new CircularProgressIndicator() : loginBtn
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/img1.jpg"),
              fit: BoxFit.cover),
        ),
        child: new Center(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: new Container(
                child: loginForm,
                height: 300.0,
                width: 300.0,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess() async {
    // _showSnackBar(user.toString());
    // setState(() => _isLoading = false);
    // var db = new DatabaseHelper();
    // await db.saveUser(user);
    // var authStateProvider = new AuthStateProvider();
    // authStateProvider.notify(AuthState.LOGGED_IN);
  }
}