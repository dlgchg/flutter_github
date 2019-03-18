import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';
import '../../generated/i18n.dart';
import '../../res/res.dart';
import '../../provide/provide.dart';
import '../../top_config.dart';

/*
 * @Date: 2019-03-13 16:12
 * @Description 登录页的widget
 */

// 登录框
Widget loginContainer(BuildContext context, AnimationController _animationController) {
  return Center(
    child: Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: loginTextSize,
              ),
            ),
            SizedBox(
              height: dimen50,
            ),
            Container(
              padding: EdgeInsets.all(dimen15),
              decoration: BoxDecoration(
                color: loginContainerColor,
                borderRadius: BorderRadius.all(Radius.circular(dimen10)),
              ),
              height: loginContainerHeight,
              width: loginContainerWidth,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: S.of(context).userName,
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (s) {
                      gitHubProvide.userName = s;
                    },
                  ),
                  SizedBox(
                    height: dimen10,
                  ),
                  TextField(
                    obscureText: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: S.of(context).passWord,
                      prefixIcon: Icon(Icons.https),
                    ),
                    onChanged: (s) {
                      gitHubProvide.passWord = s;
                    },
                  ),
                  SizedBox(
                    height: dimen40,
                  ),
                  Provide<GitHubProvide>(
                      builder: (context, child, GitHubProvide provide) {
                        return InkWell(
                          onTap: provide.loading
                              ? null
                              : () {
                            if (provide.userName.isNotEmpty &&
                                provide.passWord.isNotEmpty) {
                              provide.gitLogin().doOnListen(() {
                                _animationController.forward();
                              }).listen((_) {
                                provide.getUserInfo().listen((_) {
                                  _animationController.reverse();
                                  Navigator.pushReplacementNamed(context, '/home');
                                }, onError: (e) {
                                  _animationController.reverse();
                                });
                              }, onError: (e) {
                                _animationController.reverse();
                              });
                            } else {
                              SnackBar snackBar = SnackBar(
                                content: Text(
                                    S.of(context).nameOrPassWordIsNotEmpty),
                              );
                              globalKey.currentState.showSnackBar(snackBar);
                            }
                          },
                          child: Container(
                            height: dimen48,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: loginColor,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(dimen2)),
                            ),
                            width: provide.loginBtnWidth,
                            alignment: AlignmentDirectional.center,
                            child: _loginButtonChild(context, provide),
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

_login(BuildContext context, AnimationController _animationController,
    GitHubProvide provide) {
  if (provide.userName.isNotEmpty && provide.passWord.isNotEmpty) {
    provide.gitLogin().doOnListen(() {
      _animationController.forward();
    }).listen((_) {
      provide.getUserInfo().listen((_) {
        Navigator.pushNamed(context, '/home');
      }).onDone(() {
        _animationController.reverse();
      });
    });
  } else {
    SnackBar snackBar = SnackBar(
      content: Text(S.of(context).nameOrPassWordIsNotEmpty),
    );
    globalKey.currentState.showSnackBar(snackBar);
  }
}

_loginButtonChild(BuildContext context, GitHubProvide provide) {
  return provide.loading
      ? Container(
          child: CircularProgressIndicator(),
          width: dimen30,
          height: dimen30,
        )
      : Text(
          S.of(context).login,
          style: TextStyle(color: loginButtonTextColor),
        );
}
