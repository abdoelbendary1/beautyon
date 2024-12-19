import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_border_radius.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Domain/Entity/specilests_entity.dart';
import 'package:beautyon/beautyonApp.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class SpecialistTabContent extends StatelessWidget {
  final List<SpecialistEntity> specialists;

  const SpecialistTabContent({super.key, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Specialist ( ${specialists.length} )',
              style: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
            ),

            // Specialists List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: specialists.length,
              itemBuilder: (context, index) {
                final specialist = specialists[index];
                return _buildSpecialistItem(specialist);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Specialist Item Widget
  Widget _buildSpecialistItem(SpecialistEntity specialist) {
    return Container(
      margin: AppPadding.only(bottom: 8),
      padding: AppPadding.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.small,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: AppBorderRadius.small,
            child: Image.asset(
              specialist.imageUrl,
              height: 80.h,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacing.horizontalSpace(12),

          // Specialist Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialist.name,
                  style: AppTextStyles.boldTextStyle(16, AppColors.blackColor),
                ),
                AppSpacing.small,
                Text(
                  specialist.role,
                  style: AppTextStyles.normalTextStyle(
                      14, AppColors.darkGrayColor),
                ),
                AppSpacing.small,
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 18.r,
                      color: index < specialist.rating
                          ? AppColors.primaryColor
                          : AppColors.lightGrayColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rating Stars
        ],
      ),
    );
  }
}
