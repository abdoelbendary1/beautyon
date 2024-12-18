import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Validators/validators.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/model/loginDataModel.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  AuthCubit cubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => cubit,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSpacing.verticalSpace(73), // Top Spacing
                Text("Sign in", style: AppTextStyles.titleStyle),
                AppSpacing.large, // 30.h Spacing
                Form(
                  key: cubit.loginFormState,
                  child: BlocBuilder<AuthCubit, AuthState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomTextField(
                            controller: cubit.emailController,
                            label: "Email",
                            hintText: "Enter Your Email",
                            icon: AppIcons.email,
                            validator: (value) {
                              return AppValidators.validateEmail(value);
                            },
                          ),
                          AppSpacing.medium, // 16.h Spacing
                          CustomTextField(
                            controller: cubit.passwordController,
                            label: "Password",
                            hintText: "Enter Your Password",
                            icon: AppIcons.lock,
                            isPassword: true,
                            validator: (value) {
                              return AppValidators.validatePassword(value);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),

                AppSpacing.small, // 10.h Spacing
                GestureDetector(
                  onTap: () {
                    cubit.navigateToForgotPass(context);
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
                  onPressed: () {
                    cubit.login(
                        loginRequest: LoginRequest(
                            email: cubit.emailController.text,
                            pass: cubit.passwordController.text),
                        context: context);
                  },
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
                        cubit.navigateToSignUpScreen(context);
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
      ),
    );
  }
}
