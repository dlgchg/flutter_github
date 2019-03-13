import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';

/*
 * @Date: 2019-03-13 17:19 
 * @Description TODO
 */

class TrendPage extends StatefulWidget {
  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).bottomNavigationBarTitle1),),
      body: Container(),
    );
  }
}

