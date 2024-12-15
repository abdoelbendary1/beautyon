import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/PhoneNumberField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              AppSpacing.verticalSpace(100), // Top spacing

              // Title
              Text("Create Account", style: AppTextStyles.titleStyle),
              AppSpacing.large, // 30.h spacing

              // Full Name Field
              CustomTextField(
                label: "Full Name",
                hintText: "Enter Your Name",
                icon: AppIcons.person,
              ),
              AppSpacing.medium, // 20.h spacing

              // Email Field
              CustomTextField(
                label: "Email",
                hintText: "Enter Your Email",
                icon: AppIcons.email,
              ),
              AppSpacing.medium, // 20.h spacing

              // Password Field
              CustomTextField(
                label: "Password",
                hintText: "Enter Your Password",
                icon: AppIcons.lock,
                isPassword: true,
              ),
              AppSpacing.medium, // 20.h spacing

              // Phone Number Field
              PhoneNumberField(
                label: "Phone Number",
                phoneController: TextEditingController(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              AppSpacing.large, // 30.h spacing

              // Sign Up Button
              CustomButton(
                isEnabled: true,
                enabledColor: AppColors.primaryColor,
                text: "Sign up",
                onPressed: () {
                  _navigateToAccCreated(context);
                },
              ),
              AppSpacing.medium, // 20.h spacing

              // Social Login Section
              const OrWithLines(),
              AppSpacing.medium, // 20.h spacing
              const SocialLoginButtons(),
              AppSpacing.large, // 30.h spacing

              // Already Have an Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have an Account? ",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {
                      _navigateToSignInScreen(context);
                    },
                    child: Text(
                      "Sign in",
                      style: AppTextStyles.linkStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.large, // 30.h spacing

              // Login as a guest
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

  void _navigateToSignInScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  void _navigateToAccCreated(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.accCreated);
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
