import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

/*
 * @Date: 2019-03-15 12:56 
 * @Description shared_preference 封装
 */

Future _get(String key) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  var value = sp.get(key);
  return value;
}

Future _set(String key, Object value) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if (value is int) {
    sp.setInt(key, value);
  } else if (value is String) {
    sp.setString(key, value);
  } else if (value is bool) {
    sp.setBool(key, value);
  } else if (value is double) {
    sp.setDouble(key, value);
  } else if (value is List<String>) {
    sp.setStringList(key, value);
  }
}

Observable getValue(String key) {
  return Observable.fromFuture(_get(key)).asBroadcastStream();
}

Observable setValue(String key, Object value) {
  return Observable.fromFuture(_set(key, value)).asBroadcastStream();
}
