import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: AppPadding.symmetric(horizontal: 16),
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
    Navigator.pushReplacementNamed(context, AppPath.signIn);
  }

  void _navigateToVerifyCode(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppPath.verifyCode);
  }
}
