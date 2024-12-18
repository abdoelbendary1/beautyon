import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Domain/Entity/packages_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Packages/package_section.dart';
import 'package:flutter/material.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PackageEntity> packages = [
      PackageEntity(
        title: 'Makeup',
        description: 'Glam Makeup for parties or engagement or any time',
        imageUrl: AppImages.onboarding2,
        price: 1000,
      ),
      PackageEntity(
        title: 'Hair Styling',
        description: 'Simple Updos or blowouts for daily or party looks',
        imageUrl: AppImages.onboarding2,
        price: 1000,
        discountedPrice: 700,
        discountPercentage: 20,
      ),
      PackageEntity(
        title: 'Makeup',
        description: 'Glam Makeup for parties or engagement or any time',
        imageUrl: AppImages.onboarding2,
        price: 1000,
      ),
    ];

    return PackageSection(packages: packages);
  }
}
