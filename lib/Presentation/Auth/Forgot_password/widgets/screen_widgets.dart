import 'package:flutter/material.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenWidgets {
  // Reusable Header Section
  static Widget buildHeader({
    required BuildContext context,
    required String title,
    required String description,
    String? email,
    required VoidCallback onBackPressed,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.darkGrayColor.withOpacity(0.3),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
            onPressed: onBackPressed,
          ),
        ),
        AppSpacing.horizontalSpace(8), // Spacing between back button and title
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.titleStyle),
              AppSpacing.small,
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.hintStyle.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              if (email != null) ...[
                AppSpacing.small,
                Text(
                  email,
                  style: AppTextStyles.boldTextStyle(16, AppColors.primaryColor),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // Reusable Input Field
  static Widget buildInputField({
    required String label,
    required String hintText,
    required String icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return CustomTextField(
      label: label,
      hintText: hintText,
      icon: icon,
      controller: controller,
      isPassword: isPassword,
    );
  }

  // Reusable Button
  static Widget buildButton({
    required String text,
    required void Function()? onPressed,
    Color? color,
    bool isEnabled = true,
  }) {
    return CustomButton(
      isEnabled: isEnabled,
      enabledColor: color ?? AppColors.primaryColor,
      text: text,
      onPressed: onPressed,
    );
  }

  // Reusable Countdown Timer
  static Widget buildTimer(String time, Color color) {
    return Text(
      time,
      style: AppTextStyles.normalTextStyle(18, color),
    );
  }
}
class OrWithLines extends StatelessWidget {
  const OrWithLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 10.w,
            endIndent: 10.w,
          ),
        ),
        Text(
          "Or",
          style: AppTextStyles.boldTextStyle(18, AppColors.darkGrayColor),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 10.w,
            endIndent: 10.w,
          ),
        ),
      ],
    );
  }
}