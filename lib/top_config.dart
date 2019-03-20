import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'provide/provide.dart';
import 'net/github_net.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

/*
 * @TIME 2019-03-14 22:13
 * @DES  TODO
 */

final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
final GlobalKey<RefreshHeaderState> headerKey = new GlobalKey<RefreshHeaderState>();
final GlobalKey<RefreshFooterState> footerKey = new GlobalKey<RefreshFooterState>();

showSnackBar(String content) {
  SnackBar snackBar = SnackBar(
    content: Text(content),
  );
  globalKey.currentState.showSnackBar(snackBar);
}

String token = "";
String accessToken = "";

// 普通请求
final Dio dio = _dio;

// 普通请求
final Dio dioActivity = _dio..interceptors.add(BearerAuthInterceptor());

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

class BearerAuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers
        .update("Authorization", (_) => 'Bearer $accessToken', ifAbsent: () => 'Bearer $accessToken');
    return super.onRequest(options);
  }
}

launchURL(String url) async {
  if(await canLaunch(url)) {
    await launch(url);
  }
}
