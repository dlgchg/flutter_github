import 'package:flutter_github/model/user_entity.dart';
import 'package:flutter_github/model/user_repos_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "UserReposEntity") {
      return UserReposEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}