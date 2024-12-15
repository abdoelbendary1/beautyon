import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/beautyonApp.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color disabledColor;
  final Color enabledColor;
  final bool isEnabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.disabledColor = AppColors.darkGrayColor,
    this.enabledColor = AppColors.darkGrayColor,
    this.isEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? enabledColor : disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.normalTextStyle(
              18,
              isEnabled
                  ? AppColors.lightGray
                  : AppColors.blackColor.withOpacity(0.5)),
        ),
      ),
    );
  }
}
