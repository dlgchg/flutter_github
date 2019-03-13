import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../generated/i18n.dart';
import '../widget/widget.dart';
import '../../provide/home_provide.dart';
import 'package:provide/provide.dart';
import 'trend.dart';
import 'star.dart';
import 'search.dart';
import 'person.dart';

/*
 * @Date: 2019-03-13 14:34 
 * @Description 主页
 */

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List pages = [
    TrendPage(),
    StarPage(),
    SearchPage(),
    PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    HomeProvide homeProvide = Provide.value<HomeProvide>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: pages[homeProvide.bottomCurrentIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
