import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widget/widget.dart';

/*
 * @TIME 2019-03-13 20:45
 * @DES  TODO
 */

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginContainer(context),
    );
  }
}
