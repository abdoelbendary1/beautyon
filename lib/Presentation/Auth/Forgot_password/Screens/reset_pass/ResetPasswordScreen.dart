import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.verticalSpace(114), // Top spacing

            // Header Section
            ScreenWidgets.buildHeader(
              context: context,
              title: "Reset Password",
              description:
                  "The new password must be different from the previously used password.",
              onBackPressed: () => _navigateToSignIn(context),
            ),

            AppSpacing.large, // Spacing

            // Password Fields
            ScreenWidgets.buildInputField(
              label: "Password",
              hintText: "Enter New Password",
              icon: AppIcons.lock,
              controller: passwordController,
              isPassword: true,
            ),
            AppSpacing.medium, // 20.h spacing
            ScreenWidgets.buildInputField(
              label: "Password",
              hintText: "Confirm Password",
              icon: AppIcons.lock,
              controller: confirmPasswordController,
              isPassword: true,
            ),

            AppSpacing.large, // 30.h spacing

            // Confirm Button
            ScreenWidgets.buildButton(
              text: "Confirm",
              onPressed: () => _navigateToPassChanged(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  void _navigateToPassChanged(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.passChanged);
  }
}
