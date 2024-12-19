import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_border_radius.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Data/Model/serviceEntity.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class ServiceTabContent extends StatelessWidget {
  final List<ServiceEntity> services;

  const ServiceTabContent({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Header
            Text(
              'Service ( ${services.length} )',
              style: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
            ),

            // Service List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return _buildServiceItem(service);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Service Item Widget
  Widget _buildServiceItem(ServiceEntity service) {
    return Container(
      margin: AppPadding.only(bottom: 8),
      padding: AppPadding.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: AppBorderRadius.small,
      ),
      child: Row(
        children: [
          // Service Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              service.imageUrl!,
              height: 50.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacing.horizontalSpace(12),

          // Service Details
          Expanded(
            child: Text(
              service.title ?? "",
              style: AppTextStyles.boldTextStyle(14, AppColors.blackColor),
            ),
          ),

          // Service Type Count
          Text(
            '(${service.typeCount}) Type',
            style: AppTextStyles.normalTextStyle(12, AppColors.primaryColor),
          ),
          const Icon(Icons.arrow_forward_ios,
              size: 14, color: AppColors.darkGrayColor),
        ],
      ),
    );
  }
}
