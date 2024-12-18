import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/PhoneNumberField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Validators/validators.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/model/signUpRequest.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  AuthCubit cubit = getIt<AuthCubit>();

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
              BlocConsumer<AuthCubit, AuthState>(
                bloc: cubit,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Form(
                    key: cubit.signUpFormState,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: cubit.signUpUsernameController,
                          validator: (value) {
                            return AppValidators.validateUsername(value);
                          },
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
                          controller: cubit.signUpEmailController,
                          validator: (value) {
                            return AppValidators.validateEmail(value);
                          },
                        ),
                        AppSpacing.medium, // 20.h spacing

                        // Password Field
                        CustomTextField(
                          label: "Password",
                          hintText: "Enter Your Password",
                          icon: AppIcons.lock,
                          isPassword: true,
                          controller: cubit.signUpPasswordController,
                          validator: (value) {
                            return AppValidators.validatePassword(value);
                          },
                        ),
                        AppSpacing.medium, // 20.h spacing

                        // Phone Number Field
                        PhoneNumberField(
                          label: "Phone Number",
                          phoneController: cubit.signUpPhoneController,
                          /*   validator: (value) {
                            return AppValidators.validatePhone(value);
                          }, */
                        ),
                      ],
                    ),
                  );
                },
              ),

              AppSpacing.large, // 30.h spacing

              // Sign Up Button
              CustomButton(
                isEnabled: true,
                enabledColor: AppColors.primaryColor,
                text: "Sign up",
                onPressed: () {
                  cubit.signUp(
                    signUpRequest: SignUpRequest(
                      email: cubit.signUpEmailController.text,
                      pass: cubit.signUpPasswordController.text,
                      username: cubit.signUpUsernameController.text,
                      phone: cubit.signUpPhoneController.text,
                    ),
                    context: context,
                  );
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
                      cubit.navigateToSignInScreen(context);
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
                onTap: () {
                  cubit.navigateToMainApp(context);
                },
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
}



