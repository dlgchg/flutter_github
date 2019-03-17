import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../top_config.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../net/net.dart';
import '../model/model.dart';
import '../util/util.dart';
import '../common/common.dart';

/*
 * @Date: 2019-03-13 14:30 
 * @Description GitHub状态管理
 */

class GitHubProvide with ChangeNotifier {
  final GitHubNet _gitHubNet;

  GitHubProvide(this._gitHubNet);

  String userName = '';
  String passWord = '';


  Response _response;

  String accessToken = '';

  setAccessToken(String value) {
    accessToken = value;
    notifyListeners();
  }

  bool loading = false;

  setLoading(bool load) {
    loading = load;
    notifyListeners();
  }

  UserEntity userEntity;

  setUserEntity(UserEntity user) {
    userEntity = user;
    notifyListeners();
  }

  UserReposEntity userReposEntity;

  setUserReposEntity(UserReposEntity userRepos) {
    userReposEntity = userRepos;
    notifyListeners();
  }

  double loginBtnWidth = 260.0;

  setLoginBtnWidth(double width) {
    loginBtnWidth = width;
    notifyListeners();
  }

  Observable _login() {
    token = 'Basic ' + base64.encode(utf8.encode('$userName:$passWord'));
    return _gitHubNet.login();
  }

  Observable gitLogin() {
    return _login()
        .doOnData((data) {
          _response = data;
          if (_response.statusCode == 201) {
            setAccessToken(_response.data['token']);
            setValue(access_token, _response.data['token'].toString());
          }
        })
        .doOnError((e) {
          if (e is DioError) {
            showSnackBar(e.response.data.toString());
          }
        })
        .doOnListen(() => setLoading(true))
        .doOnDone(() => setLoading(false));
  }

  Observable getUserInfo() {
    return _gitHubNet.user(accessToken).doOnData((data) {
      _response = data;
      if (_response.statusCode == 200) {
        UserEntity userEntity = UserEntity.fromJson(_response.data as Map);
        setUserEntity(userEntity);
        print(_response.data.toString());
      }
    }).doOnError((e) {
      if (e is DioError) {
        showSnackBar(e.response.data.toString());
      }
    });
  }
}
