// Importing necessary packages
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:screenutil_module/main.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: _buildPages(),
        onDone: () => _navigateToSignInScreen(context),
        onSkip: () => _navigateToSignInScreen(context),
        showSkipButton: true,
        skip: const Text("Skip", style: TextStyle(color: Colors.white)),
        next: const Icon(Icons.arrow_forward, color: AppColors.lightGray),
        done: Text(
          "Go!",
          style: AppTextStyles.boldTextStyle(18, AppColors.lightGray),
        ),
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          color: AppColors.lightGray,
          activeColor: AppColors.primaryColor,
          activeSize: Size(40.0.w, 10.0.h),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        globalBackgroundColor: AppColors.blackColor, // Background color
        curve: Curves.easeInOut,
      ),
    );
  }

  // Helper function to build the pages
  List<PageViewModel> _buildPages() {
    return [
      _buildPage(
        "Everything you need for your beauty\nin one place.",
        "Discover your beauty with our distinguished services: spa, makeup, hair styling, and more.",
        AppImages.onboarding1,
      ),
      _buildPage(
        "Your beauty is in safe hands.",
        "Because you deserve the best, we are here to take care of you.",
        AppImages.onboarding2,
      ),
      _buildPage(
        "Style and Care for the Whole Family",
        "Tailored Beauty Services for Every You.",
        AppImages.onboarding3,
      ),
    ];
  }

  // Helper function to build each page view
  PageViewModel _buildPage(String title, String body, String imagePath) {
    return PageViewModel(
      titleWidget: _buildTitle(title),
      bodyWidget: _buildBody(body),
      image: _buildImage(imagePath),
      decoration: _getPageDecoration(),
    );
  }

  // Helper function for title widget using AutoSizeText
  Widget _buildTitle(String title) {
    return AutoSizeText(
      title,
      style: AppTextStyles.boldTextStyle(20, Colors.white),
      textAlign: TextAlign.center,
      maxLines: 2, // Allow wrapping in two lines if needed
    );
  }

  // Helper function for body widget using AutoSizeText
  Widget _buildBody(String body) {
    return AutoSizeText(
      body,
      style: AppTextStyles.normalTextStyle(14, AppColors.lightGray),
      textAlign: TextAlign.center,
      maxLines: 3, // Allow wrapping in three lines if needed
    );
  }

  // Optimized Image Builder with Fade-In Effect
  Widget _buildImage(String path) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          path,
          fit: BoxFit.cover,
        ),
        /*  FadeInImage.assetNetwork(
          placeholder:
              "assets/images/onbarding1.png", // Add a lightweight placeholder image
          image: path,
          fit: BoxFit.cover,
          /* fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 300), */
        ), */
        Container(
          color: Colors.black.withOpacity(0.5), // Black overlay
        ),
      ],
    );
  }

  // Page decoration helper
  PageDecoration _getPageDecoration() {
    return PageDecoration(
      imagePadding: EdgeInsets.zero,
      bodyPadding: AppPadding.medium,
      titlePadding: AppPadding.only(top: 50, bottom: 10),
      contentMargin: AppPadding.all(0),
      fullScreen: true,
      pageColor: Colors.transparent,
    );
  }

  // Navigation helper function
  void _navigateToSignInScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppPath.signIn);
  }
}
