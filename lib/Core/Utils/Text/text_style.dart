import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle boldTextStyle(double fontSize, Color color) {
    return GoogleFonts.cairo(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  // Default text style for normal text
  static TextStyle normalTextStyle(double fontSize, Color color) {
    return GoogleFonts.cairo(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  // Text style for small, light text
  static TextStyle smallLightTextStyle(double fontSize, Color color) {
    return GoogleFonts.cairo(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle titleStyle = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle hintStyle = GoogleFonts.cairo(
    fontSize: 14,
    color: AppColors.darkGrayColor,
  );

  static TextStyle linkStyle = GoogleFonts.cairo(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}
