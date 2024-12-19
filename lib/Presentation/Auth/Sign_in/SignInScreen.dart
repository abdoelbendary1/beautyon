import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/widgets/screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Components/SocialLoginButtons.dart';
import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Validators/validators.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/Model/loginDataModel.dart';
import 'package:beautyon/Presentation/Auth/cubit/auth_cubit.dart';

class SignInScreen extends StatelessWidget {
  final AuthCubit _authCubit = getIt<AuthCubit>();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: AppPadding.medium,
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (_) => _authCubit,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                AppSpacing.small,
                _buildForm(context),
                AppSpacing.small,
                _buildForgotPassword(context),
                AppSpacing.large,
                _buildSignInButton(context),
                AppSpacing.large,
                const OrWithLines(),
                AppSpacing.medium,
                const SocialLoginButtons(),
                AppSpacing.large,
                _buildFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        AppSpacing.verticalSpace(73),
        Text("Sign in", style: AppTextStyles.titleStyle),
        AppSpacing.large,
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _authCubit.loginFormState,
      child: BlocBuilder<AuthCubit, AuthState>(
        bloc: _authCubit,
        builder: (_, __) {
          return Column(
            children: [
              CustomTextField(
                controller: _authCubit.emailController,
                label: "Email",
                hintText: "Enter Your Email",
                icon: AppIcons.email,
                validator: AppValidators.validateEmail,
              ),
              AppSpacing.medium,
              CustomTextField(
                controller: _authCubit.passwordController,
                label: "Password",
                hintText: "Enter Your Password",
                icon: AppIcons.lock,
                isPassword: true,
                validator: AppValidators.validatePassword,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () => _authCubit.navigateToForgotPass(context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Forget Password?",
          style: AppTextStyles.linkStyle.copyWith(
            color: AppColors.darkGrayColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return ScreenWidgets.buildButton(
      onPressed: () {
        _authCubit.login(
          loginRequest: LoginRequest(
            email: _authCubit.emailController.text,
            pass: _authCubit.passwordController.text,
          ),
          context: context,
        );
      },
      text: "Sign in",
      color: AppColors.primaryColor,
      isEnabled: true,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't Have an Account? "),
            AppSpacing.horizontalSpace(4),
            GestureDetector(
              onTap: () => _authCubit.navigateToSignUpScreen(context),
              child: Text("Sign Up", style: AppTextStyles.linkStyle),
            ),
          ],
        ),
        AppSpacing.large,
        GestureDetector(
          onTap: () => _authCubit.navigateToMainApp(context),
          child: Text(
            "Login as a guest",
            style: AppTextStyles.linkStyle.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
