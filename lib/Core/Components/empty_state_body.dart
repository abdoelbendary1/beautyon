import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateBody extends StatelessWidget {
  final String imagePath;
  final String message;

  const EmptyStateBody({
    Key? key,
    required this.imagePath,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 200.h,
          width: 200.w,
          fit: BoxFit.contain,
        ),
        AppSpacing.verticalSpace(20),
        Padding(
          padding: AppPadding.symmetric(
            horizontal: 24,
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
