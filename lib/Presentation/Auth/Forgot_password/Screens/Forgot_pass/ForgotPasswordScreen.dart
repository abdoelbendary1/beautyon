/* import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpacing.verticalSpace(114), // Top spacing

            // Header Section
            _buildHeader(
              context: context,
              title: "Forget Password",
              description:
                  "Please enter your email to receive a verification code to set your password.",
              onBackPressed: () => _navigateToSignIn(context),
            ),

            AppSpacing.large, // 40.h Spacing

            // Email Input Field
            _buildEmailField(emailController),

            AppSpacing.large, // 40.h Spacing

            // Send Code Button
            _buildSendCodeButton(context),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onBackPressed,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back Button
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
              Text(
                title,
                style: AppTextStyles.titleStyle.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              AppSpacing.medium, // 20.h spacing
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.hintStyle.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Email Input Field
  Widget _buildEmailField(TextEditingController emailController) {
    return CustomTextField(
      label: "Email",
      hintText: "Enter Your Email",
      icon: AppIcons.email,
      controller: emailController,
    );
  }

  // Send Code Button
  Widget _buildSendCodeButton(BuildContext context) {
    return CustomButton(
      isEnabled: true,
      enabledColor: AppColors.primaryColor,
      text: "Send Code",
      onPressed: () => _navigateToVerifyCode(context),
    );
  }

  // Navigation to Verify Code Screen
  void _navigateToVerifyCode(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.verifyCode);
  }

  // Navigation to Sign In Screen
  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }
}
 */

import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSpacing.verticalSpace(114), // Top spacing

            // Header Section
            ScreenWidgets.buildHeader(
              context: context,
              title: "Forget Password",
              description:
                  "Please enter your email to receive a verification code to set your password.",
              onBackPressed: () => _navigateToSignIn(context),
            ),

            AppSpacing.large, // 40.h Spacing

            // Email Input Field
            ScreenWidgets.buildInputField(
              label: "Email",
              hintText: "Enter Your Email",
              icon: AppIcons.email,
              controller: emailController,
            ),

            AppSpacing.large, // 40.h Spacing

            // Send Code Button
            ScreenWidgets.buildButton(
              text: "Send Code",
              onPressed: () => _navigateToVerifyCode(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  void _navigateToVerifyCode(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.verifyCode);
  }
}
