import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'provide/provide.dart';
import 'net/github_net.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
 * @TIME 2019-03-14 22:13
 * @DES  TODO
 */

final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

showSnackBar(String content) {
  SnackBar snackBar = SnackBar(
    content: Text(content),
  );
  globalKey.currentState.showSnackBar(snackBar);
}

String token = "";


// 普通请求
final Dio dio = _dio;

// 只限于等于使用
final Dio dioLogin =_dio
  ..interceptors.add(AuthInterceptor());

Dio _dio = Dio()
  ..options = _baseOptions;
//  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

BaseOptions _baseOptions = BaseOptions(
  baseUrl: 'https://api.github.com/',
  connectTimeout: 5000,
  receiveTimeout: 5000,
);

GitHubNet _gitHubNet = GitHubNet();
GitHubProvide gitHubProvide = GitHubProvide(_gitHubNet);

HomeProvide homeProvide = HomeProvide();


final providers = Providers();

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers
        .update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}
