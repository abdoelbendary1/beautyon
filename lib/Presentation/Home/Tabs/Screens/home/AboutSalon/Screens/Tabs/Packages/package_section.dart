import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/CustomTextField.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Domain/Entity/packages_entity.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class PackageSection extends StatelessWidget {
  final List<PackageEntity> packages;

  const PackageSection({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Package ( ${packages.length} )',
              style: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
            ),
            AppSpacing.medium,

            // Packages List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final package = packages[index];
                return _buildPackageCard(package);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Package Card Widget
  Widget _buildPackageCard(PackageEntity package) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Package Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              package.imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          AppSpacing.horizontalSpace(12),

          // Package Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      package.title,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextStyles.boldTextStyle(16, AppColors.blackColor),
                    ),
                    CustomButton(
                      text: "Book now",
                      onPressed: () {},
                      isEnabled: true,
                      enabledColor: AppColors.primaryColor,
                      borderRadius: 12.r,
                      height: 35.h,
                      isFilled: true,
                      textColor: AppColors.whiteColor,
                      textStyle: AppTextStyles.normalTextStyle(
                          14.sp, AppColors.whiteColor),
                      width: 120.w,
                    ),
                  ],
                ),
                AppSpacing.small,

                // Price with discount
                Row(
                  children: [
                    if (package.discountedPrice != null)
                      Row(
                        children: [
                          Text(
                            '${package.price.toStringAsFixed(0)} \$',
                            style: AppTextStyles.normalTextStyle(
                                12, AppColors.darkGrayColor),
                          ),
                          AppSpacing.horizontalSpace(4),
                          Text(
                            '${package.discountedPrice!.toStringAsFixed(0)} \$',
                            style: AppTextStyles.boldTextStyle(
                                14, AppColors.primaryColor),
                          ),
                          AppSpacing.horizontalSpace(6),
                          if (package.discountPercentage != null)
                            Text(
                              'Get ${package.discountPercentage!.toStringAsFixed(0)} %',
                              style: AppTextStyles.normalTextStyle(
                                  12, AppColors.primaryColor),
                            ),
                        ],
                      )
                    else
                      Text(
                        '${package.price.toStringAsFixed(0)} \$',
                        style: AppTextStyles.boldTextStyle(
                            14, AppColors.primaryColor),
                      ),
                  ],
                ),
                AppSpacing.small,

                // Description
                Text(
                  package.description,
                  style: AppTextStyles.normalTextStyle(
                      12, AppColors.darkGrayColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Book Now Button
        ],
      ),
    );
  }
}
