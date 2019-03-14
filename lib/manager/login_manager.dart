import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import '../net/login_net.dart';

/*
 * @Date: 2019-03-14 13:23 
 * @Description TODO
 */

class LoginManager {
  final LoginNet _loginNet;

  LoginManager(this._loginNet);

  Observable login(String userName, String passWord) {
    var token = "basic "+ base64Encode(utf8.encode('$userName$passWord'));
    return _loginNet.login();
  }
}
