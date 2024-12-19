import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class AppBorderRadius {
  // Custom border radius
  static BorderRadius circular(double radius) =>
      BorderRadius.circular(radius.r);

  // Symmetric border radius
  static BorderRadius symmetric({double horizontal = 0, double vertical = 0}) =>
      BorderRadius.only(
        topLeft: Radius.circular(vertical.r),
        topRight: Radius.circular(vertical.r),
        bottomLeft: Radius.circular(horizontal.r),
        bottomRight: Radius.circular(horizontal.r),
      );

  // Only specific corners
  static BorderRadius only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft.r),
        topRight: Radius.circular(topRight.r),
        bottomLeft: Radius.circular(bottomLeft.r),
        bottomRight: Radius.circular(bottomRight.r),
      );

  // Predefined commonly used border radii
  static final BorderRadius small = BorderRadius.circular(8.r);
  static final BorderRadius medium = BorderRadius.circular(16.r);
  static final BorderRadius large = BorderRadius.circular(24.r);
  static final BorderRadius extraLarge = BorderRadius.circular(32.r);
}
