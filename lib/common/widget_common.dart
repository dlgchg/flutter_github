import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../generated/i18n.dart';

/*
 * @Date: 2019-03-13 16:14 
 * @Description TODO
 */

List bottomNavigationBarItemData(BuildContext context) => [
  [Icon(Icons.trending_up), S.of(context).bottomNavigationBarTitle1],
  [Icon(Icons.star), S.of(context).bottomNavigationBarTitle2],
  [Icon(Icons.search), S.of(context).bottomNavigationBarTitle3],
  [Icon(Icons.person_pin), S.of(context).bottomNavigationBarTitle4],
];
