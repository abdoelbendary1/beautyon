import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Gallery/gallery_tab_content.dart';
import 'package:flutter/material.dart';

class GalleryTabScreen extends StatelessWidget {
  const GalleryTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> galleryImages = [
      AppImages.onboarding1,
      AppImages.onboarding2,
      AppImages.onboarding3,
      AppImages.ad1,
      AppImages.ad2,
      AppImages.ad3,
      AppImages.homeHeader,
      AppImages.goldenSalon,
      AppImages.onboarding1,
      AppImages.onboarding1,
      AppImages.onboarding1,
      AppImages.onboarding1,
    ];

    return GalleryTabContent(imageUrls: galleryImages);
  }
}
