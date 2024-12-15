import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // Vertical Spacing
  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);

  // Horizontal Spacing
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

  // Predefined commonly used spacing
  static final small = SizedBox(height: 10.h);
  static final medium = SizedBox(height: 16.h);
  static final large = SizedBox(height: 30.h);
  static final extraLarge = SizedBox(height: 46.h);
}
