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
  return Observable.fromFuture(futureGet(url, params: params))
      .asBroadcastStream();
}

Observable post(String url, {Map<String, dynamic> params}) {
  return Observable.fromFuture(futurePost(url, params: params))
      .asBroadcastStream();
}

Observable activity(int type, String url,
    {Map<String, dynamic> params}) {
  Future future;
  switch (type) {
    case 0:
      future = _activityGet(url, params: params);
      break;
    case 1:
      future = _activityPut(url, params: params);
      break;
    case 2:
      future = _activityDelete(url, params: params);
      break;
    case 3:
      future = _activityPatch(url, params: params);
      break;
    case 4:
      future = _activityPost(url, params: params);
      break;
  }
  return Observable.fromFuture(future).asBroadcastStream();
}

Observable postLoginJson(String url, {Object params}) {
  return Observable.fromFuture(_postLoginJson(url, params: params))
      .asBroadcastStream();
}

Future futureGet(String url,
    {Map<String, dynamic> params, Options options}) async {
  Response response = await dio.get(url, queryParameters: params);
  return response;
}

Future _activityPut(String url,
    {Map<String, dynamic> params}) async {
  Response response =
      await dioActivity.put(url, queryParameters: params);
  return response;
}

Future _activityGet(String url,
    {Map<String, dynamic> params}) async {
  Response response =
      await dioActivity.get(url, queryParameters: params);
  return response;
}

Future _activityDelete(String url,
    {Map<String, dynamic> params}) async {
  Response response =
      await dioActivity.delete(url, queryParameters: params);
  return response;
}

Future _activityPost(String url,
    {Map<String, dynamic> params}) async {
  Response response =
      await dioActivity.post(url, data: json.encode(params));
  return response;
}

Future _activityPatch(String url,
    {Map<String, dynamic> params}) async {
  Response response =
  await dioActivity.patch(url, data: json.encode(params));
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
  Response response = await Dio().get(url, queryParameters: params);
  return response;
}

Future getUrl(String url, {Map<String, dynamic> params}) async {
  Response response = await Dio().get(url, queryParameters: params);
  return response;
}
