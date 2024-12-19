import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_path.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/cubit/home_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/GoldenGlowSection.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/ServiceListSection.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/SubscriptionSection.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/customHeader.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/customSlider.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class HomeTabHelper {
/*   final HomeCubit cubit = getIt<HomeCubit>();
 */
  // SliverAppBar for fixed header
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 170.h, // Height of the header
      floating: false,
      pinned: false, // Keep the header pinned when scrolling
      backgroundColor: AppColors.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: CustomHeader(
          imagePath: AppImages.homeHeader,
          onNotificationPressed: () {},
          onFilterPressed: () {},
          onSearchChanged: (value) {},
        ),
      ),
    );
  }

  // Body of the HomeScreen, consisting of multiple sections
  Widget buildHomeBody(BuildContext context, {required HomeCubit cubit}) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: AppPadding.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.small,
                CustomSliderSection(cubit: cubit),
                AppSpacing.medium,
                Text(
                  'Explore the Salon',
                  style: AppTextStyles.boldTextStyle(18, AppColors.blackColor),
                ),
                AppSpacing.small,
                GoldenGlowSection(
                  imageUrl: AppImages.goldenSalon,
                  title: "Golden Glow",
                  description:
                      "Welcome to Golden Glow, your one-stop destination for beauty and relaxation. We offer premium services.",
                  rating: "4.5 (100)",
                  onTap: () {
                    Navigator.pushNamed(context, AppPath.aboutSalon);
                  },
                ),
                AppSpacing.large,
                SubscriptionSection(
                  imageUrl: AppImages.goldenSalon,
                  title:
                      "Take advantage of our monthly subscription offer: book 5 sessions and get one free!",
                  buttonText: "Book Now",
                  onButtonPressed: () {},
                ),
                AppSpacing.large,
                ServiceListSection(services: cubit.services),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for Custom Slider Section
class CustomSliderSection extends StatelessWidget {
  final HomeCubit cubit;

  const CustomSliderSection({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      imageUrls: cubit.networkImages,
      aspectRatio: 2.5,
      autoPlay: true,
      borderRadius: 16.0,
    );
  }
}
