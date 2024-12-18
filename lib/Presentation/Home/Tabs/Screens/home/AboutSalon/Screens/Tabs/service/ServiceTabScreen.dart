import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Data/model/serviceEntity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/service/service_tab_content.dart';
import 'package:flutter/material.dart';

class ServiceTabScreen extends StatelessWidget {
  const ServiceTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceEntity> services = [
      ServiceEntity(
          title: "Haircut", imageUrl: AppImages.onboarding1, typeCount: 10),
      ServiceEntity(
          title: "Makeup", imageUrl: AppImages.onboarding1, typeCount: 10),
      ServiceEntity(
          title: "Lashes", imageUrl: AppImages.onboarding1, typeCount: 10),
      ServiceEntity(
          title: "Lip Filler", imageUrl: AppImages.onboarding1, typeCount: 10),
      ServiceEntity(
          title: "Microbliding",
          imageUrl: AppImages.onboarding1,
          typeCount: 10),
      ServiceEntity(
          title: "Nails", imageUrl: AppImages.onboarding1, typeCount: 10),
    ];

    return ServiceTabContent(services: services);
  }
}
