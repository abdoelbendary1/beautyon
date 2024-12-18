import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Domain/Entity/specilests_entity.dart';
import 'package:flutter/material.dart';

class SpecialistTabContent extends StatelessWidget {
  final List<SpecialistEntity> specialists;

  const SpecialistTabContent({super.key, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Specialist ( ${specialists.length} )',
              style: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
            ),
            AppSpacing.small,

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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              specialist.imageUrl,
              height: 80,
              width: 100,
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
                      size: 18,
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
