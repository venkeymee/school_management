
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class LoginScreenContract {
  void onLoginError(String errorTxt);
}

class LoginScreenService {
  LoginScreenContract _view;
  LoginScreenService(this._view);

  doLogin(String username, String password) async{
String  req=json.encode({"sessiontrkr":"69","pwd":password,"apitrkr":"1553980482724","username":username});
      final response = await http.post('http://ec2-13-127-249-0.ap-south-1.compute.amazonaws.com:8080/gettrained-webapp/ws1/lgn',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: req
      );
      log(response.body);
      return response.body;
    }
}