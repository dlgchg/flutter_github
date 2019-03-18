import 'package:rxdart/rxdart.dart';
import '../util/net_util.dart';
import 'package:dio/dio.dart';

/*
 * @TIME 2019-03-14 22:40
 * @DES  TODO
 */

class GitHubNet {
  Observable<dynamic> login() => postLoginJson('authorizations', params: {
        'client_id': '1cb27874fc405af5d2e5',
        'client_secret': '0e11c6aa68de8a5deef663bc815f5bf6099687f5',
        'scopes': ['user', 'repo', 'notifications'],
      });

  Observable<dynamic> user(String accessToken) =>
      get('user', params: {'access_token': accessToken});

  Future<Response> star(String login, int page,
      {String owner, repo, int size}) async {
    Response response = await futureGet(
        'users/$login/starred${owner == null ? '' : '/$owner/$repo'}',
        params: {
          'client_id': '1cb27874fc405af5d2e5',
          'client_secret': '0e11c6aa68de8a5deef663bc815f5bf6099687f5',
          'page': page,
          'size': size ?? 15,
          'sort': 'created',
          'direction': 'desc',
        });
    return response;
  }

  Future trend(String language, since) async {
    return await getNoGitApi('https://github-trending-api.now.sh/repositories',
        params: {
          'language': language,
          'since': since,
        });
  }

  Future languages() async {
    return await getNoGitApi('https://github-trending-api.now.sh/languages');
  }
}
