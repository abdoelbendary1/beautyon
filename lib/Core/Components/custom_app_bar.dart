import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPrefixTap;
  final VoidCallback? onSuffixTap;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    this.onPrefixTap,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onPrefixTap,
            child: CircleAvatar(
              backgroundColor: AppColors.darkGrayColor.withOpacity(0.2),
              radius: 20.r,
              child: Center(
                child: Icon(
                  prefixIcon,
                  color: Colors.black54,
                  size: 22.sp,
                ),
              ),
            ),
          ),
          Center(
            child: Text(title,
                style: AppTextStyles.boldTextStyle(
                    22.sp, AppColors.blackColor.withOpacity(0.7))),
          ),
          suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkGrayColor.withOpacity(0.2),
                    radius: 20.r,
                    child: Center(
                      child: Icon(
                        suffixIcon,
                        color: Colors.black54,
                        size: 22.sp,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
