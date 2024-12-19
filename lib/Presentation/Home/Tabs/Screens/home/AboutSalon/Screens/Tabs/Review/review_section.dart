import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Domain/Entity/review_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewSection extends StatelessWidget {
  final List<ReviewEntity> reviews;
  final VoidCallback onAddReview;

  const ReviewSection({
    super.key,
    required this.reviews,
    required this.onAddReview,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Review ',
                    style:
                        AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
                    children: [
                      TextSpan(
                        text: '(${reviews.length})',
                        style: AppTextStyles.boldTextStyle(
                            18, AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onAddReview,
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: AppColors.primaryColor),
                      Text(
                        'Add Review',
                        style: AppTextStyles.normalTextStyle(
                            14, AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Reviews List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return _buildReviewCard(review);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Review Card Widget
  Widget _buildReviewCard(ReviewEntity review) {
    return Container(
      padding: AppPadding.symmetric(vertical: 16),
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
