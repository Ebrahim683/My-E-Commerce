import 'package:flutter/cupertino.dart';

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
}
