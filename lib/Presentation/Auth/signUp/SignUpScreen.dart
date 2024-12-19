import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/PhoneNumberField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Validators/validators.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/Model/signUpRequest.dart';
import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  final AuthCubit cubit = getIt<AuthCubit>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.medium,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h), // Top spacing

                // Title
                _buildHeader(),
                AppSpacing.large,

                // Form Section
                _buildSignUpForm(),

                AppSpacing.large,

                // Sign Up Button
                _buildSignUpButton(context),

                AppSpacing.large,

                // Social Login Section
                const OrWithLines(),
                AppSpacing.large,
                const SocialLoginButtons(),
                AppSpacing.large,

                // Already Have an Account
                _buildSignInOption(context),

                AppSpacing.large,

                // Login as a guest
                GestureDetector(
                  onTap: () => cubit.navigateToMainApp(context),
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
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return ScreenWidgets.buildButton(
      onPressed: () {
        _handleSignUp(context);
      },
      text: "Sign Up",
      color: AppColors.primaryColor,
      isEnabled: true,
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text("Create account", style: AppTextStyles.titleStyle),
        AppSpacing.large,
      ],
    );
  }

  Widget _buildSignUpForm() {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: cubit,
      listener: (context, state) {
        // Handle state changes if necessary
      },
      builder: (context, state) {
        return Form(
          key: cubit.signUpFormState,
          child: Column(
            children: [
              CustomTextField(
                controller: cubit.signUpUsernameController,
                validator: AppValidators.validateUsername,
                label: "Full Name",
                hintText: "Enter Your Name",
                icon: AppIcons.person,
              ),
              AppSpacing.medium,
              CustomTextField(
                label: "Email",
                hintText: "Enter Your Email",
                icon: AppIcons.email,
                controller: cubit.signUpEmailController,
                validator: AppValidators.validateEmail,
              ),
              AppSpacing.medium,
              CustomTextField(
                label: "Password",
                hintText: "Enter Your Password",
                icon: AppIcons.lock,
                isPassword: true,
                controller: cubit.signUpPasswordController,
                validator: AppValidators.validatePassword,
              ),
              AppSpacing.medium,
              PhoneNumberField(
                label: "Phone Number",
                phoneController: cubit.signUpPhoneController,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSignInOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have an Account? ",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        GestureDetector(
          onTap: () => cubit.navigateToSignInScreen(context),
          child: Text(
            "Sign in",
            style: AppTextStyles.linkStyle,
          ),
        ),
      ],
    );
  }

  void _handleSignUp(BuildContext context) {
    cubit.signUp(
      signUpRequest: SignUpRequest(
        email: cubit.signUpEmailController.text,
        pass: cubit.signUpPasswordController.text,
        username: cubit.signUpUsernameController.text,
        phone: cubit.signUpPhoneController.text,
      ),
      context: context,
    );
  }
}
