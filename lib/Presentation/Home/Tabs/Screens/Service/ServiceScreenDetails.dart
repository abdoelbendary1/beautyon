import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/custom_app_bar.dart';
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Data/model/serviceEntity.dart';
import 'package:beautyon/Domain/Entity/review_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/customSlider.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class ServiceDetailsScreen extends StatelessWidget {
  ServiceEntity? service;
  final List<ReviewEntity> reviews = [
    ReviewEntity(
      userName: 'Kyle',
      comment: 'The professional was very punctual and respectful',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 4,
    ),
    ReviewEntity(
      userName: 'Jacob Jones',
      comment: 'They listened to my requests and gave great advice',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 5,
    ),
    ReviewEntity(
      userName: 'Jenny Wilson',
      comment:
          'Wasn’t satisfied with the result because it wasn’t what I expected',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 3,
    ),
    ReviewEntity(
      userName: 'Leslie Alexander',
      comment: 'The service was very professional, and the tools were clean',
      imageUrl: AppImages.onboarding1,
      date: '1 Week',
      rating: 5,
    ),
  ];

  ServiceDetailsScreen({super.key, this.service});

  @override
  Widget build(BuildContext context) {
    /* var args = ModalRoute.of(context)!.settings.arguments as ServiceEntity?;
    service = args; */
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.large,
            buildAppBar(context),
            buildSliders(),
            AppSpacing.small,
            buildBody(),
            AppSpacing.large,
            _buildReviewsSection(),
            buildButton(),
            AppSpacing.medium,
          ],
        ),
      ),
    );
  }

  Padding buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: CustomButton(
        text: 'Book Now',
        enabledColor: AppColors.primaryColor,
        borderRadius: 12.r,
        height: 70.h,
        isFilled: true,
        isEnabled: true,
        onPressed: () {},
        textColor: AppColors.whiteColor,
        width: double.infinity,
        textStyle: AppTextStyles.boldTextStyle(18.sp, AppColors.whiteColor),
      ),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service?.title ?? "",
                style: AppTextStyles.boldTextStyle(18, AppColors.blackColor),
              ),
              Row(
                children: [
                  const Icon(Icons.star,
                      color: AppColors.primaryColor, size: 18),
                  Text(
                    '${service?.rating ?? 0.0} (${service?.reviewsCount})',
                    style: AppTextStyles.normalTextStyle(
                        14, AppColors.primaryColor),
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.small,
          Row(
            children: [
              if (service?.discountedPrice != null) ...[
                Text(
                  '${service?.price?.toStringAsFixed(0)} \$',
                  style: AppTextStyles.normalTextStyle(
                      14, AppColors.darkGrayColor),
                ),
                AppSpacing.horizontalSpace(6),
                Text(
                  '${service?.discountedPrice!.toStringAsFixed(0)} \$',
                  style:
                      AppTextStyles.boldTextStyle(16, AppColors.primaryColor),
                ),
              ] else
                Text(
                  '${service?.price?.toStringAsFixed(0)} \$',
                  style:
                      AppTextStyles.boldTextStyle(16, AppColors.primaryColor),
                ),
            ],
          ),
          AppSpacing.medium,

          // Description Section
          Text(
            'Description:',
            style: AppTextStyles.boldTextStyle(16, AppColors.blackColor),
          ),
          AppSpacing.small,
          Text(
            service?.description ?? "",
            style: AppTextStyles.normalTextStyle(14, AppColors.darkGrayColor),
          ),
          AppSpacing.medium,

          // Key Topics
          Text(
            'Key Topics:',
            style: AppTextStyles.boldTextStyle(16, AppColors.blackColor),
          ),
          AppSpacing.small,
          _buildKeyTopics(service?.keyTopics ?? []),
        ],
      ),
    );
  }

  Widget buildSliders() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: CustomSlider(
        imageUrls: service!.imageUrls!,
        aspectRatio: 2.5,
        autoPlay: true,
        borderRadius: 16.0,
      ),
    );
  }

  CustomAppBar buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: service?.title ?? "",
      prefixIcon: Icons.arrow_back,
      onPrefixTap: () => Navigator.pop(context),
    );
  }

  // Key Topics List
  Widget _buildKeyTopics(List<String> topics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: topics
          .map(
            (topic) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(fontSize: 16, color: AppColors.blackColor),
                ),
                Expanded(
                  child: Text(
                    topic,
                    style: AppTextStyles.normalTextStyle(
                        14, AppColors.darkGrayColor),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  // Dummy Reviews Section
  Widget _buildReviewsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Review ( ${service?.reviewsCount} )',
                style: AppTextStyles.boldTextStyle(16, AppColors.primaryColor),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All
                },
                child: Text(
                  'View All',
                  style: AppTextStyles.linkStyle,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviews.length < 4 ? reviews.length : 3,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return _buildReviewCard(review);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ReviewEntity review) {
    return Container(
      /* margin: const EdgeInsets.only(bottom: 16), */
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            height: 60, // Fixed height
            width: 60, // Fixed width (same as height to keep it square)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(review.imageUrl),
                fit: BoxFit.cover, // Ensures the image adapts to the size
              ),
            ),
          ),
          AppSpacing.horizontalSpace(12),

          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username and Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName,
                      style:
                          AppTextStyles.boldTextStyle(14, AppColors.blackColor),
                    ),
                    Text(
                      review.date,
                      style: AppTextStyles.smallLightTextStyle(
                          12, AppColors.darkGrayColor),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 12,
                          color: index < review.rating
                              ? AppColors.primaryColor
                              : AppColors.lightGrayColor,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.small,

                // Comment
                Text(
                  review.comment,
                  style: AppTextStyles.normalTextStyle(
                      12, AppColors.darkGrayColor),
                ),
                AppSpacing.small,

                // Rating Stars
              ],
            ),
          ),
        ],
      ),
    );
  }
}
