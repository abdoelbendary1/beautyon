import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:screenutil_module/main.dart';
import '../../../../../../Domain/Entity/UserEntity.dart';
import 'searchBar.dart';

class CustomHeader extends StatelessWidget {
  final UserEntity? userEntity;

  final String imagePath;
  final VoidCallback onNotificationPressed;
  final VoidCallback onFilterPressed;
  final Function(String) onSearchChanged;

  const CustomHeader({
    Key? key,
    this.userEntity,
    required this.imagePath,
    required this.onNotificationPressed,
    required this.onFilterPressed,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Dark Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blackColor.withOpacity(0.4),
              ),
            ),
          ),
          // SafeArea Content
          SafeArea(
            child: Padding(
              padding: AppPadding.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.small,

                  // Row for user info and notification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, ${userEntity?.userName ?? "Guest"}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AppSpacing.verticalSpace(4),
                          Row(
                            children: [
                              /*   const Icon(
                                FontAwesomeIcons.locationPin,
                                color: AppColors.darkGrayColor,
                                size: 15,
                              ), */
                              GestureDetector(
                                  onTap: onNotificationPressed,
                                  child: ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      AppColors
                                          .whiteColor, // Choose your desired color
                                      BlendMode
                                          .srcIn, // This mode makes the image color match the filter
                                    ),
                                    child: ImageIcon(
                                      size: 30.sp,
                                      const AssetImage(AppIcons.location),
                                    ),
                                  )),
                              Text(
                                userEntity?.location ?? "Unknown Loacation",
                                style: TextStyle(
                                  color: AppColors.darkGrayColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      /*    GestureDetector(
                          onTap: onNotificationPressed,
                          child: const ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              AppColors.whiteColor, // Choose your desired color
                              BlendMode
                                  .srcIn, // This mode makes the image color match the filter
                            ),
                            child: ImageIcon(
                              AssetImage(AppIcons.notification),
                            ),
                          )), */

                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.solidBell,
                          color: AppColors.whiteColor,
                          size: 20.sp,
                        ),
                        onPressed: onNotificationPressed,
                      ),
                    ],
                  ),
                  AppSpacing.medium,
                  // Search Bar with Filter Icon
                  Row(
                    children: [
                      Expanded(
                        child: SearchBarWidget(
                          hintText: "Search...",
                          borderColor: Colors.purple,
                          iconColor: Colors.white,
                          fillColor: Colors.transparent,
                          onSearchChanged: onSearchChanged,
                        ),
                      ),
                      AppSpacing.horizontalSpace(8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2.w),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                          onPressed: onFilterPressed,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
