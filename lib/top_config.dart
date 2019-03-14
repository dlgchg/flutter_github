import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'dart:convert';
import 'provide/github_provide.dart';
import 'net/github_net.dart';

/*
 * @TIME 2019-03-14 22:13
 * @DES  TODO
 */

String token = "";

final Dio dio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://api.github.com/',
    connectTimeout: 5000,
    receiveTimeout: 5000,
  )
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

GitHubNet _gitHubNet = GitHubNet();
GitHubProvide gitHubProvide = GitHubProvide(_gitHubNet);

final providers = Providers();

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers.update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}
