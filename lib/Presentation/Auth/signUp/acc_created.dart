import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: AppPadding.large,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Image
              Image.asset(
                "assets/images/AccountCreatedSuccess.png",
                height: 200.h,
              ),
              AppSpacing.large, // 30.h spacing

              // Success Text
              Text(
                "Your account has been created Successfully",
                style: AppTextStyles.titleStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacing.large, // 30.h spacing

              // Back to Login Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    _navigateToSignIn(context);
                  },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppPath.signIn);
  }
}
