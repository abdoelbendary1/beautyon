import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;

  const VerifyCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
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
              title: "Verify Code",
              description:
                  "Verification code has been sent to your email.\nCheck your email and enter the 6-digit code.",
              email: widget.email,
              onBackPressed: () => _navigateToSignIn(context),
            ),

            AppSpacing.large, // 30.h spacing

            // OTP Input Section
            _buildOtpInput(),

            AppSpacing.medium, // 20.h spacing

            // Resend Section
            _buildResendSection(),

            AppSpacing.medium, // 20.h spacing

            // Countdown Timer
            ScreenWidgets.buildTimer("02:00", AppColors.primaryColor),

            AppSpacing.large, // 30.h spacing

            // Send Code Button
            ScreenWidgets.buildButton(
              text: "Send Code",
              isEnabled: _isButtonEnabled,
              onPressed:
                  _isButtonEnabled ? () => _navigateToResetPass(context) : null,
            ),
          ],
        ),
      ),
    );
  }

  // OTP Input Widget
  Widget _buildOtpInput() {
    return Pinput(
      length: 6,
      controller: _otpController,
      onChanged: (value) {
        setState(() {
          _isButtonEnabled = value.length == 6;
        });
      },
      defaultPinTheme: PinTheme(
        height: 50.h,
        width: 50.w,
        textStyle: AppTextStyles.boldTextStyle(18, AppColors.blackColor),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGrayColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: 50.h,
        width: 50.w,
        textStyle: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  // Resend Section Widget
  Widget _buildResendSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn’t receive the code? ",
          style: AppTextStyles.normalTextStyle(14, AppColors.blackColor),
        ),
        TextButton(
          onPressed: () {
            // Logic for resending the code
          },
          child: Text(
            "Resend",
            style: AppTextStyles.normalTextStyle(14, AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  // Navigation to Sign In
  void _navigateToSignIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  // Navigation to Reset Password
  void _navigateToResetPass(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.resetPass);
  }
}
