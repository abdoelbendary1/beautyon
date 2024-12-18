import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isFilled;
  final Color enabledColor;
  final Color disabledColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double width;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.isFilled = true, // Defaults to filled button
    this.enabledColor = AppColors.darkGrayColor,
    this.disabledColor = AppColors.lightGray,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.height = 60.0,
    this.width = double.infinity,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color currentColor =
        isEnabled ? enabledColor : disabledColor; // Button color based on state
    final TextStyle finalTextStyle = textStyle ??
        AppTextStyles.normalTextStyle(
          18,
          isEnabled
              ? (isFilled
                  ? Colors.white
                  : enabledColor) // Text color for enabled state
              : AppColors.darkGrayColor.withOpacity(0.5), // Disabled state
        );

    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? currentColor : Colors.transparent,
          foregroundColor: currentColor, // Ripple effect color
          side: BorderSide(
            color: isEnabled ? enabledColor : disabledColor, // Border color
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: isFilled && isEnabled
              ? 2
              : 0, // Add subtle shadow for filled enabled button
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: finalTextStyle,
        ),
      ),
    );
  }
}
