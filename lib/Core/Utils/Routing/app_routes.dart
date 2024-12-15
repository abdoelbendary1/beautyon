import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/Forgot_pass/ForgotPasswordScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/changed_pass_succes/PasswordChangedScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/reset_pass/ResetPasswordScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/verify_code/VerifyCodeScreen.dart';
import 'package:beautyon/Presentation/Auth/Sign_in/SignInScreen.dart';
import 'package:beautyon/Presentation/Auth/signUp/SignUpScreen.dart';
import 'package:beautyon/Presentation/Auth/signUp/acc_created.dart';
import 'package:beautyon/Presentation/Onboarding/OnboardingScreen.dart';
import 'package:beautyon/Presentation/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String onboarding = '/onboarding';
  static const String forgotPass = '/forgotPass';
  static const String verifyCode = '/verifyCode';
  static const String resetPass = '/resetPass';
  static const String passChanged = '/passChanged';
  static const String accCreated = '/accCreated';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (context) {
            return const OnBoardingScreen();
          },
        );
      case signIn:
        return MaterialPageRoute(
          builder: (context) {
            return const SignInScreen();
          },
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) {
            return const SignUpScreen();
          },
        );
      case forgotPass:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordScreen();
          },
        );
      case verifyCode:
        return MaterialPageRoute(
          builder: (context) {
            return const VerifyCodeScreen(
              email: "",
            );
          },
        );
      case resetPass:
        return MaterialPageRoute(
          builder: (context) {
            return ResetPasswordScreen();
          },
        );
      case passChanged:
        return MaterialPageRoute(
          builder: (context) {
            return const PasswordChangedScreen();
          },
        );
      case accCreated:
        return MaterialPageRoute(
          builder: (context) {
            return const AccountCreatedScreen();
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
