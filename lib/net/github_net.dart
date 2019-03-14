import 'package:rxdart/rxdart.dart';
import '../util/net_util.dart';

/*
 * @TIME 2019-03-14 22:40
 * @DES  TODO
 */

class GitHubNet {
  Observable<dynamic> login() => postJson('authorizations', params: {
        'client_id': '1cb27874fc405af5d2e5',
        'client_secret': '0e11c6aa68de8a5deef663bc815f5bf6099687f5',
        'scopes': ['user', 'repo', 'notifications']
      });
}
