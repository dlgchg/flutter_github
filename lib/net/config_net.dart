import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
 * @Date: 2019-03-14 14:16 
 * @Description TODO
 */

const String github = 'https://api.github.com/';

class Api {
  static const authorizations = github + 'authorizations';
  static const accessToken = github + 'user';
  static const users = github + 'users/';// access_token
}
