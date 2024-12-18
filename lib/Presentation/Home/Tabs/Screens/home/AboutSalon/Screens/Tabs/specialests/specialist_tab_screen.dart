import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Domain/Entity/specilests_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/specialests/specialist_tab_content.dart';
import 'package:flutter/material.dart';

class SpecialistTabScreen extends StatelessWidget {
  const SpecialistTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SpecialistEntity> specialists = [
      SpecialistEntity(
          name: 'Ahmed Mohamed',
          role: 'Hair Stylist',
          imageUrl: AppImages.onboarding2,
          rating: 4),
      SpecialistEntity(
          name: 'Emma Ahmed',
          role: 'Hair Stylist',
          imageUrl: AppImages.onboarding2,
          rating: 5),
      SpecialistEntity(
          name: 'Ahmed Mohamed',
          role: 'Hair Stylist',
          imageUrl: AppImages.onboarding2,
          rating: 4),
      SpecialistEntity(
          name: 'Emma Ahmed',
          role: 'Hair Stylist',
          imageUrl: AppImages.onboarding2,
          rating: 5),
    ];

    return SpecialistTabContent(specialists: specialists);
  }
}
