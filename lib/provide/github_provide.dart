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
  String login = '';
  int page = 0;

  String language = '';
  String since = 'monthly';
  String sort = 'best match';

  // 搜索页的全局变量
  String searchKey = '';
  String searchReposSort = 'best match';
  String searchUsersSort = 'best match';
  String searchOrder = 'desc';
  String searchLanguages = '';
  int searchType = 0;

  String raw = 'https://raw.githubusercontent.com/';

  String fullName = '';
  String treesBranch = 'master';
  bool reposStared = false;
  bool reposWatched = false;
  bool usersFollowed = false;

  setReposStared(bool stared) {
    reposStared = stared;
    notifyListeners();
  }

  setReposWatched(bool watched) {
    reposWatched = watched;
    notifyListeners();
  }
  setUsersFollowed(bool followed) {
    usersFollowed = followed;
    notifyListeners();
  }

  Response _response;

  double topBgHeight = 0;

  setTopBgHeight(double h) {
    topBgHeight = h;
    notifyListeners();
  }

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

  List<StarEntity> starList = [];

  setStarEntityList(List<StarEntity> list) {
    starList = list;
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
        login = userEntity.login;
        setUserEntity(userEntity);
//        print(_response.data.toString());
      }
    }).doOnError((e) {
      if (e is DioError) {
        showSnackBar(e.response.data.toString());
      }
    });
  }

  Observable stared(int type) {
    return _gitHubNet.stared(type,fullName);
  }

  Observable watched(int type) {
    return _gitHubNet.watched(type,fullName);
  }

  Observable followed(int type, String login) {
    return _gitHubNet.followed(type,login);
  }

  Observable patchUser() {
    Map<String, dynamic> params = {
      'name': userEntity.name,
      'email': userEntity.email,
      'blog': userEntity.blog,
      'company': userEntity.company,
      'location': userEntity.location,
      'hireable': userEntity.hireable,
      'bio': userEntity.bio,
    };
    return _gitHubNet.patchUser(3,params).doOnData((data) {
      Response response = data;
      if(response.statusCode == 200) {
        UserEntity userEntity = UserEntity.fromJson(response.data);
        setUserEntity(userEntity);
      }
    });
  }

  Future getStar({String otherLogin}) async {
    return await _gitHubNet.star(otherLogin ?? login, page);
  }

  Future getTrend() async {
    return await _gitHubNet.trend(language, since);
  }

  Future getSearch() async {
    return await _gitHubNet.search(
      searchType,
      searchKey,
      sort: searchType == 0 ? searchReposSort : searchUsersSort,
      order: searchOrder,
      language: searchLanguages,
    );
  }

  Future getRepos() async {
    return await _gitHubNet.repos(fullName);
  }

  Future getReadme(String branch) async {
    return await _gitHubNet.readme('$raw$fullName/$branch/README.md');
  }

  Future getTrees() async {
    return await _gitHubNet.trees(fullName, treesBranch);
  }

  Future getTree(String url) async {
    return await _gitHubNet.tree(url);
  }

  Future url(String url) async {
    return await _gitHubNet.url(url, page);
  }

  Future contributions(String login) async {
    return await _gitHubNet.contributions(login);
  }
}
