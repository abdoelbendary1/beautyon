import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding:AppPadding.large,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSuccessImage(
                imagePath: "assets/images/passChangedSuccess.png",
                imageHeight: 200.h,
              ),
              AppSpacing.medium, // 20.h Spacing
              _buildSuccessText(
                text: "Password Change Successfully",
                textColor: AppColors.primaryColor,
              ),
              AppSpacing.large, // 30.h Spacing
              _buildBackToLoginButton(
                context: context,
                buttonText: "Back to Login",
                onPressed: () => _navigateToSignIn(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Success Image Widget
  Widget _buildSuccessImage({
    required String imagePath,
    required double imageHeight,
  }) {
    return Image.asset(
      imagePath,
      height: imageHeight,
      fit: BoxFit.contain,
    );
  }

  // Success Text Widget
  Widget _buildSuccessText({
    required String text,
    required Color textColor,
  }) {
    return Text(
      text,
      style: AppTextStyles.titleStyle.copyWith(
        color: textColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Back to Login Button Widget
  Widget _buildBackToLoginButton({
    required BuildContext context,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Navigation to Sign In
  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppPath.signIn);
  }
}
