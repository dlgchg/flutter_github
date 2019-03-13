import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/widget_common.dart';
import '../../provide/home_provide.dart';
import 'package:provide/provide.dart';

/*
 * @Date: 2019-03-13 16:12 
 * @Description 不常用的widget
 */

Widget bottomNavigationBar(BuildContext context) {
  HomeProvide homeProvide = Provide.value(context);
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
}
