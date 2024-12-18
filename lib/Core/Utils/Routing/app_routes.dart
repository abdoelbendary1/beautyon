import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/Forgot_pass/ForgotPasswordScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/changed_pass_succes/PasswordChangedScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/reset_pass/ResetPasswordScreen.dart';
import 'package:beautyon/Presentation/Auth/Forgot_password/Screens/verify_code/VerifyCodeScreen.dart';
import 'package:beautyon/Presentation/Auth/Sign_in/SignInScreen.dart';
import 'package:beautyon/Presentation/Auth/signUp/SignUpScreen.dart';
import 'package:beautyon/Presentation/Auth/signUp/acc_created.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/ServiceScreenDetails.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/salon_about_screen.dart';
import 'package:beautyon/Presentation/Home/bottomNavScreen.dart';
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
  static const String mainScreen = '/mainScreen';
  static const String aboutSalon = '/aboutSalon';
  static const String serviceDetails = '/serviceDetails';

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
            return SignInScreen();
          },
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) {
            return SignUpScreen();
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
            return const ResetPasswordScreen();
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
      case mainScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BottomNavScreen();
          },
        );
      case aboutSalon:
        return MaterialPageRoute(
          builder: (context) {
            return const SalonScreenWithPanel();
          },
        );
      case serviceDetails:
        return MaterialPageRoute(
          builder: (context) {
            return ServiceDetailsScreen();
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
