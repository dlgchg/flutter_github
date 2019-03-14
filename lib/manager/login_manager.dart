import 'dart:convert';
import 'package:dio/dio.dart';
import '../net/config_net.dart';
import 'dart:io';

/*
 * @Date: 2019-03-14 13:23 
 * @Description TODO
 */

class LoginManager {
  Future login(String userName, String passWord) {
    var basicToken = base64.encode(utf8.encode('$userName:$passWord'));
    return _login(basicToken);
  }

  Future _login(String basicToken) async {
    final requestHeader = {'Authorization': 'Basic $basicToken'};

    final requestBody = json.encode({
      'client_id': '1cb27874fc405af5d2e5',
      'client_secret': '0e11c6aa68de8a5deef663bc815f5bf6099687f5',
      'scopes': ['user', 'repo', 'notifications']
    });

    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(
        Api.authorizations,
        data: requestBody,
        options: Options(
          headers: requestHeader,
        ),
      );
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
