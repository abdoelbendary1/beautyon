import 'package:beautyon/Core/Utils/Routing/app_path.dart';
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
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPath.splash:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case AppPath.onboarding:
        return MaterialPageRoute(
          builder: (context) {
            return const OnBoardingScreen();
          },
        );
      case AppPath.signIn:
        return MaterialPageRoute(
          builder: (context) {
            return SignInScreen();
          },
        );
      case AppPath.signUp:
        return MaterialPageRoute(
          builder: (context) {
            return SignUpScreen();
          },
        );
      case AppPath.forgotPass:
        return MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordScreen();
          },
        );
      case AppPath.verifyCode:
        return MaterialPageRoute(
          builder: (context) {
            return const VerifyCodeScreen(
              email: "",
            );
          },
        );
      case AppPath.resetPass:
        return MaterialPageRoute(
          builder: (context) {
            return const ResetPasswordScreen();
          },
        );
      case AppPath.passChanged:
        return MaterialPageRoute(
          builder: (context) {
            return const PasswordChangedScreen();
          },
        );
      case AppPath.accCreated:
        return MaterialPageRoute(
          builder: (context) {
            return const AccountCreatedScreen();
          },
        );
      case AppPath.mainScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BottomNavScreen();
          },
        );
      case AppPath.aboutSalon:
        return MaterialPageRoute(
          builder: (context) {
            return const SalonScreenWithPanel();
          },
        );
      case AppPath.serviceDetails:
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
