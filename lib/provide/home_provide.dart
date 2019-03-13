import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
 * @Date: 2019-03-13 17:21 
 * @Description TODO
 */

class HomeProvide with ChangeNotifier {
  int bottomCurrentIndex = 0;

  currentIndex(int index) {
    bottomCurrentIndex = index;
    notifyListeners();
  }
}
