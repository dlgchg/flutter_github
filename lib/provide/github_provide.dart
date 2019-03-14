import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

/*
 * @Date: 2019-03-13 14:30 
 * @Description GitHub状态管理
 */

class GitHubProvide with ChangeNotifier {

  String userName = '';
  String passWord = '';

  String accessToken = '';

  setAccessToken(String token){
    accessToken = token;
    notifyListeners();
  }

  Observable login() {

  }

}

