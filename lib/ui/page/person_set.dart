import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../model/model.dart';
import '../../res/res.dart';
import '../../generated/i18n.dart';
import '../../util/util.dart';
import '../../common/common.dart';

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
        title: Text(userEntity.login),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: dimen20,
          ),
          _item(Icons.art_track, userEntity.name ?? ''),
          _item(Icons.description, userEntity.bio ?? ''),
          SizedBox(
            height: dimen20,
          ),
          _item(Icons.account_balance, userEntity.company ?? ''),
          _item(Icons.location_city, userEntity.location ?? ''),
          _item(Icons.http, userEntity.blog),
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
                  onTap: (){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      title: Text(S.of(context).exit_n),
                      actions: <Widget>[
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                          setValue(access_token, '');
                          Navigator.pushReplacementNamed(context, '/login');
                        }, child: Text(S.of(context).exit),),
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text(S.of(context).cancel),),
                      ],
                    ));

                  },
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _item(IconData icon, String title) {
    return Container(
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
              style:
                  TextStyle(color: title == null ? Colors.grey : Colors.black),
            ),
            flex: 1,
          ),
          Icon(
            Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
