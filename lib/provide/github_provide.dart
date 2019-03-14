import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../manager/login_manager.dart';
import '../ui/page/home.dart';

/*
 * @Date: 2019-03-13 14:30 
 * @Description GitHub状态管理
 */

class GitHubProvide with ChangeNotifier {
  String userName = '';
  String passWord = '';

  String accessToken = '';

  bool login = false;
  String response = '';

  setAccessToken(String token) {
    accessToken = token;
    notifyListeners();
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
