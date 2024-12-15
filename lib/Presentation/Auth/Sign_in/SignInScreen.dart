import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpacing.verticalSpace(73), // Top Spacing
              Text("Sign in", style: AppTextStyles.titleStyle),
              AppSpacing.large, // 30.h Spacing
              CustomTextField(
                label: "Email",
                hintText: "Enter Your Email",
                icon: AppIcons.email,
              ),
              AppSpacing.medium, // 16.h Spacing
              CustomTextField(
                label: "Password",
                hintText: "Enter Your Password",
                icon: AppIcons.lock,
                isPassword: true,
              ),
              AppSpacing.small, // 10.h Spacing
              GestureDetector(
                onTap: () {
                  _navigateToForgotPass(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forget Password?",
                    style: AppTextStyles.linkStyle.copyWith(
                      fontSize: 16,
                      color: AppColors.darkGrayColor,
                    ),
                  ),
                ),
              ),
              AppSpacing.large, // 30.h Spacing
              CustomButton(
                isEnabled: true,
                enabledColor: AppColors.primaryColor,
                text: "Sign in",
                onPressed: () {},
              ),
              AppSpacing.medium, // 20.h Spacing
              const OrWithLines(),
              AppSpacing.medium, // 20.h Spacing
              const SocialLoginButtons(),
              AppSpacing.extraLarge, // 46.h Spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an Account? "),
                  AppSpacing.horizontalSpace(4), // Small spacing between text
                  GestureDetector(
                    onTap: () {
                      _navigateToSignUpScreen(context);
                    },
                    child: Text(
                      "Sign Up",
                      style: AppTextStyles.linkStyle,
                    ),
                  ),
                ],
              ),
              AppSpacing.large, // 20.h Spacing
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Login as a guest",
                  style: AppTextStyles.linkStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signUp);
  }

  void _navigateToForgotPass(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.forgotPass);
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
