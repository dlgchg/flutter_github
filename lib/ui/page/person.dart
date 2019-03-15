import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../res/res.dart';
import '../../model/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/i18n.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description 个人页面
 */

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    UserEntity userEntity = gitHubProvide.userEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userEntity.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: containerColor,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(dimen10),
                          width: dimen60,
                          height: dimen60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dimen10),
                            image: DecorationImage(
                              image: NetworkImage(userEntity.avatarUrl),
                            ),
                          ),
                        ),
                        Container(
                          height: dimen60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  userEntity.login,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: dimen15,
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  width: ScreenUtil().setWidth(700),
                                  child: Text(
                                    userEntity.bio,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: dimen12,
                                    ),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  userEntity.createdAt,
                                  style: TextStyle(
                                    fontSize: dimen12,
                                  ),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    PopupMenuDivider(),
                    Container(
                      height: dimen40,
                      child: Row(
                        children: <Widget>[
                          _countItem(
                              (userEntity.publicRepos + userEntity.publicRepos)
                                  .toString(),
                              S.of(context).following),
                          _countItem(userEntity.followers.toString(),
                              S.of(context).followers),
                          _countItem(userEntity.following.toString(),
                              S.of(context).following),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: dimen10),
                color: containerColor,
                child: Column(
                  children: <Widget>[
                    _item(Icons.account_balance, userEntity.company),
                    _item(Icons.location_on, userEntity.location),
                    _item(Icons.email, userEntity.email),
                    _item(Icons.http, userEntity.blog),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: dimen10),
                color: containerColor,
                child: Column(
                  children: <Widget>[
                    _item(Icons.settings, S.of(context).set),
                    _item(Icons.error, S.of(context).about),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _countItem(String count, title) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(count,
              style: TextStyle(
                color: primaryColor,
                fontSize: dimen15,
              )),
          Text(title,
              style: TextStyle(
                fontSize: dimen12,
              )),
        ],
      ),
      flex: 1,
    );
  }

   _item(IconData icon, String title) {
    return InkWell(
      onTap: (){
        showAboutDialog(context: context);
      },
      child: Container(
        padding: EdgeInsets.only(
            top: dimen15, left: dimen20, right: dimen20, bottom: dimen15),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: primaryColor,
              size: dimen20,
            ),
            SizedBox(
              width: dimen15,
            ),
            Text(title ?? 'Blog'),
          ],
        ),
      ),
    );
  }
}
