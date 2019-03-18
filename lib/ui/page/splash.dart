import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../top_config.dart';
import '../../res/res.dart';
import '../../common/common.dart';
import '../../util/util.dart';


/*
 * @TIME 2019-03-13 20:45
 * @DES  TODO
 */

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: primaryColor,
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: loginColor,
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getValue(access_token).listen((data) {
      if(data != null && data.toString().isNotEmpty) {
        gitHubProvide.setAccessToken(data.toString());
        gitHubProvide.getUserInfo().listen((data) {
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }
}
