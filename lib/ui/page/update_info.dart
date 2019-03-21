import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../res/res.dart';
import '../../generated/i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../top_config.dart';
import '../../model/model.dart';

/*
 * @Date: 2019-03-21 09:51 
 * @Description TODO
 */

class UpdateInfoPage extends StatefulWidget {
  final String _title;
  final String _content;

  UpdateInfoPage(this._title, this._content);

  @override
  _UpdateInfoPageState createState() => _UpdateInfoPageState();
}

class _UpdateInfoPageState extends State<UpdateInfoPage> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget._content,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: widget._content.length,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = gitHubProvide.userEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: dimen20,
          ),
          Container(
            height: dimen50,
            color: containerColor,
            padding: EdgeInsets.only(left: dimen10, right: dimen10),
            alignment: AlignmentDirectional.centerStart,
            child: Theme(
              data: ThemeData(primaryColor: containerColor),
              child: TextField(
                maxLines: 1,
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(hintText: ''),
                onChanged: (value){
                  switch(widget._title) {
                    case 'Name':
                      userEntity.name = value;
                      break;
                    case 'Description':
                      userEntity.bio = value;
                      break;
                    case 'Company':
                      userEntity.company = value;
                      break;
                    case 'City':
                      userEntity.location = value;
                      break;
                    case 'Blog':
                      userEntity.blog = value;
                      break;
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: dimen50,
          ),
          Container(
            width: ScreenUtil.getInstance().width.toDouble(),
            margin: EdgeInsets.all(dimen20),
            child: RaisedButton(
              onPressed: () {
                gitHubProvide.patchUser().listen((data) {
                  Navigator.pop(context);
                }, onError: (e) {
                  showSnackBar('修改失败!');
                });
              },
              color: primaryColor,
              textColor: containerColor,
              child: Text(S.of(context).updated),
            ),
          ),
        ],
      ),
    );
  }
}
