import 'package:flutter/cupertino.dart';

class SizeUtils {
  static EdgeInsets paddingAll({double val = 8.0}) {
    return EdgeInsets.all(val);
  }

  static EdgeInsets paddingXY({x = 0.0, y = 0.0}) {
    return EdgeInsets.symmetric(horizontal: x, vertical: y);
  }

  static EdgeInsets padding({top = 0.0, down = 0.0, left = 0.0, right = 0.0}) {
    return EdgeInsets.only(
      top: top,
      bottom: down,
      left: left,
      right: right,
    );
  }

  static EdgeInsets marginAll({double val = 8.0}) {
    return EdgeInsets.all(val);
  }

  static EdgeInsets marginXY({x = 0.0, y = 0.0}) {
    return EdgeInsets.symmetric(horizontal: x, vertical: y);
  }

  static EdgeInsets margin({top = 0.0, down = 0.0, left = 0.0, right = 0.0}) {
    return EdgeInsets.only(
      top: top,
      bottom: down,
      left: left,
      right: right,
    );
  }

  static double marginDeft = 8.0;
}
