import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AppImages.splash,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }

  navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppPath.onboarding);
    });
  }
}
