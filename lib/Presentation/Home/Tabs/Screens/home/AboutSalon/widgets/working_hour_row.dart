import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';

class WorkingHourRow extends StatelessWidget {
  final String day;
  final String hours;
  final bool isClosed;

  const WorkingHourRow({
    super.key,
    required this.day,
    required this.hours,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day,
              style: AppTextStyles.normalTextStyle(14, AppColors.blackColor)),
          Text(
            hours,
            style: AppTextStyles.normalTextStyle(
              14,
              isClosed ? AppColors.redColor : AppColors.darkGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
