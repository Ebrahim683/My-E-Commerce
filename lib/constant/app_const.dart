import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConst {
  static TextStyle textStyle(Color color,
      [double? fontSize, FontWeight? fontWeight, String? fontFamily]) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static const appBarColor = Color.fromRGBO(241, 196, 15, 1);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const bottomNavColor = Color.fromRGBO(240, 178, 122, 1);
  static const bottomNavIconColor = Color.fromRGBO(81, 46, 95, 1);
  static const bottomNavSelectedIconColor = Color.fromARGB(255, 49, 117, 4);
}
