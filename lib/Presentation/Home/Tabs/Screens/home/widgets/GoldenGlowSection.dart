import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldenGlowSection extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String rating;
  final VoidCallback onTap;

  const GoldenGlowSection({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120.h,
            ),
          ),
          AppSpacing.small,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.star, color: Colors.purple, size: 16.r),
                  SizedBox(width: 4.w),
                  Text(
                    rating,
                    style: TextStyle(color: Colors.purple, fontSize: 14.sp),
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.small,
          Text(
            description,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
          AppSpacing.small,
        ],
      ),
    );
  }
}
