import 'dart:async';
import '../top_config.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';

/*
 * @TIME 2019-03-14 22:31
 * @DES  网络请求类，将dio封装为rxdart方式
 */

Future _get(String url, {Map<String, dynamic> params}) async {
  var response = await dio.get(url, queryParameters: params);
  return response.data;
}

Future _post(String url, {Map<String, dynamic> params}) async {
  var response = await dio.post(url, data: params);
  return response.data;
}

Future _postJson(String url, {Object params}) async {
  var response = await dio.post(url, data: json.encode(params));
  return response.data;
}


Observable get(String url, {Map<String, dynamic> params}) {
  return Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
}

Observable post(String url, {Map<String, dynamic> params}) {
  return Observable.fromFuture(_post(url, params: params)).asBroadcastStream();
}

Observable postJson(String url, {Object params}) {
  return Observable.fromFuture(_postJson(url, params: params)).asBroadcastStream();
}


