import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../manager/login_manager.dart';
import '../ui/page/home.dart';
import 'package:rxdart/rxdart.dart';
import '../top_config.dart';
import 'dart:convert';
import '../net/github_net.dart';
import 'package:dio/dio.dart';

/*
 * @Date: 2019-03-13 14:30 
 * @Description GitHub状态管理
 */

class GitHubProvide with ChangeNotifier {
  String userName = '';
  String passWord = '';

  String accessToken = '';

  bool loading = false;
  String response = '';

  final GitHubNet _gitHubNet;

  GitHubProvide(this._gitHubNet);

  Observable _login() {
    token = 'Basic ' + base64.encode(utf8.encode('$userName:$passWord'));
    return _gitHubNet.login();
  }

  Observable gitLogin() {
    return _login()
        .doOnData((data) => response = data.toString())
        .doOnError((e) {
          if (e is DioError) {
            response = e.response.data.toString();
          }
        })
        .doOnListen(() => loading = true)
        .doOnDone(() => loading = false);
  }

  githubLogin(BuildContext context) {
    LoginManager().login(userName, passWord).then((data) {
      if (data != null) {
        response = data.toString();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      }
    });
  }
}
