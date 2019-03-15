import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page.dart';
import '../../provide/provide.dart';
import '../widget/widget.dart';
import 'package:provide/provide.dart';

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
    return Scaffold(
      body: Provide<HomeProvide>(builder: (context, child, provide) {
        return pages[provide.bottomCurrentIndex];
      }),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}
