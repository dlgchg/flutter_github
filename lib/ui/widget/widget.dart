import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/common.dart';
import 'package:provide/provide.dart';
import '../../provide/provide.dart';

export 'login_widget.dart';

Widget bottomNavigationBar(BuildContext context) {
  return Provide<HomeProvide>(builder: (context, child, homeProvide) {
    return BottomNavigationBar(
      items: bottomNavigationBarItemData(context).map((data) {
        return BottomNavigationBarItem(icon: data[0], title: Text(data[1]));
      }).toList(),
      currentIndex: homeProvide.bottomCurrentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (position) {
        homeProvide.currentIndex(position);
      },
    );
  });
}