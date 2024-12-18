import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Domain/Entity/salon_entity.dart';
import 'package:flutter/material.dart';

class SalonDetailsContainer extends StatelessWidget {
  final SalonEntity salon;

  const SalonDetailsContainer({super.key, required this.salon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.small,

          // Salon Name and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                salon.name,
                style: AppTextStyles.boldTextStyle(16, AppColors.blackColor),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 18,
                    color: index < salon.rating
                        ? AppColors.primaryColor
                        : AppColors.lightGrayColor,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.small,

          // Services
          Text(
            salon.services,
            style: AppTextStyles.normalTextStyle(14, AppColors.darkGrayColor),
          ),
          AppSpacing.medium,

          // Location
          Row(
            children: [
              const Icon(Icons.location_on,
                  size: 18, color: AppColors.darkGrayColor),
              AppSpacing.horizontalSpace(6),
              Text(
                salon.location,
                style:
                    AppTextStyles.normalTextStyle(14, AppColors.darkGrayColor),
              ),
            ],
          ),
          AppSpacing.small,

          // Working Hours
          Row(
            children: [
              const Icon(Icons.schedule,
                  size: 18, color: AppColors.darkGrayColor),
              AppSpacing.horizontalSpace(6),
              Text(
                salon.workingHours,
                style:
                    AppTextStyles.normalTextStyle(14, AppColors.darkGrayColor),
              ),
            ],
          ),
          AppSpacing.small,

          // Open/Closed Status
          Row(
            children: [
              const Icon(Icons.storefront,
                  size: 18, color: AppColors.primaryColor),
              AppSpacing.horizontalSpace(6),
              Text(
                salon.isOpen ? '• Open' : '• Closed',
                style: AppTextStyles.boldTextStyle(
                  14,
                  salon.isOpen ? Colors.green : AppColors.redColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
