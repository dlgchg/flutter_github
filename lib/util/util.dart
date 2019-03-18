export 'net_util.dart';
export 'shared_preferences_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

colorRGB(String color) {
  if(color == null) {
    return Colors.grey;
  }
  color = color.replaceAll('#', '');
  int r = int.parse(color.substring(0, 2), radix: 16);
  int g = int.parse(color.substring(2, 4), radix: 16);
  int b = int.parse(color.substring(4), radix: 16);
  return Color.fromARGB(0xFF, r, g, b);
}