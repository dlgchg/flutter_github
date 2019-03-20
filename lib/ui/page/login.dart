import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../res/res.dart';
import '../widget/widget.dart';

/*
 * @TIME 2019-03-13 20:45
 * @DES  TODO
 */

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: gitHubProvide.loginBtnWidth, end: 48.0)
        .animate(_animationController)
          ..addListener(() {
            gitHubProvide.setLoginBtnWidth(_animation.value);
          },);
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      key: globalKey,
      backgroundColor: primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: loginColor,
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        child: loginContainer(context, _animationController),
      ),
    );
  }
}
