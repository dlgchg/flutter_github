import 'dart:async';
import '../top_config.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

/*
 * @TIME 2019-03-14 22:31
 * @DES  网络请求类，将dio封装为rxdart方式
 */


Observable get(String url, {Map<String, dynamic> params}) {
  return Observable.fromFuture(futureGet(url, params: params)).asBroadcastStream();
}

Observable post(String url, {Map<String, dynamic> params}) {
  return Observable.fromFuture(futurePost(url, params: params)).asBroadcastStream();
}

Observable postLoginJson(String url, {Object params}) {
  return Observable.fromFuture(_postLoginJson(url, params: params)).asBroadcastStream();
}


Future futureGet(String url, {Map<String, dynamic> params}) async {
  print(url);
  Response response = await dio.get(url, queryParameters: params);
  return response;
}

Future futurePost(String url, {Map<String, dynamic> params}) async {
  Response response = await dio.post(url, data: params);
  return response;
}

Future _postLoginJson(String url, {Object params}) async {
  Response response = await dioLogin.post(url, data: json.encode(params));
  return response;
}

Future getNoGitApi(String url, {Map<String, dynamic> params}) async {
  print(url);
  Response response = await Dio().get(url, queryParameters: params);
  return response;
}

