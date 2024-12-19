import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  // Custom padding with EdgeInsets
  static EdgeInsets all(double value) => EdgeInsets.all(value.w);

  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left.w,
        top: top.h,
        right: right.w,
        bottom: bottom.h,
      );

  // Predefined commonly used paddings
  static final small = EdgeInsets.all(8.w);
  static final medium = EdgeInsets.all(16.w);
  static final large = EdgeInsets.all(24.w);
  static final extraLarge = EdgeInsets.all(32.w);
}
