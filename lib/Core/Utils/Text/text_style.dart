import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle boldTextStyle(double fontSize, Color color) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  // Default text style for normal text
  static TextStyle normalTextStyle(double fontSize, Color color) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  // Text style for small, light text
  static TextStyle smallLightTextStyle(double fontSize, Color color) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle titleStyle = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle hintStyle = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.darkGrayColor,
  );

  static TextStyle linkStyle = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}
