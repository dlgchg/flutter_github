import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../model/model.dart';
import '../../res/res.dart';
import '../../generated/i18n.dart';
import '../../util/util.dart';
import '../../common/common.dart';
import 'page.dart';
import 'package:provide/provide.dart';
import '../../provide/provide.dart';

/*
 * @TIME 2019-03-20 20:30
 * @DES  TODO
 */

class PersonSetPage extends StatefulWidget {
  @override
  _PersonSetPageState createState() => _PersonSetPageState();
}

class _PersonSetPageState extends State<PersonSetPage> {
  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = gitHubProvide.userEntity;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userEntity.login),
      ),
      body: Provide<GitHubProvide>(builder: (context, child, provide) {
        userEntity = provide.userEntity;
        return Column(
          children: <Widget>[
            SizedBox(
              height: dimen20,
            ),
            _item(Icons.art_track, userEntity.name ?? '', 'Name'),
            _item(Icons.description, userEntity.bio ?? '', 'Description'),
            SizedBox(
              height: dimen20,
            ),
            _item(Icons.account_balance, userEntity.company ?? '', 'Company'),
            _item(Icons.location_city, userEntity.location ?? '', 'City'),
            _item(Icons.http, userEntity.blog, 'Blog'),
            SizedBox(
              height: dimen20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: Container(
                      color: containerColor,
                      alignment: AlignmentDirectional.center,
                      height: dimen50,
                      child: Text(
                        S.of(context).exit,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(S.of(context).exit_n),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setValue(access_token, '');
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/login',
                                      (_) => false,
                                    );
                                  },
                                  child: Text(S.of(context).exit),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(S.of(context).cancel),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  _item(IconData icon, String title, String sTitle) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpdateInfoPage(sTitle, title ?? '')));
      },
      child: Container(
        color: containerColor,
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
            Expanded(
              child: Text(
                title ?? "UnKnown",
                style: TextStyle(
                    color: title == null ? Colors.grey : Colors.black),
              ),
              flex: 1,
            ),
            Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}
