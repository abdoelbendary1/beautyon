import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class GalleryTabContent extends StatelessWidget {
  final List<String> imageUrls;

  const GalleryTabContent({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Gallery ( ${imageUrls.length} )',
            style: AppTextStyles.boldTextStyle(18, AppColors.primaryColor),
          ),
          AppSpacing.medium,

          // Responsive Grid
          Expanded(
            child: MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: imageUrls.length,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (context, index) {
                return _buildImageItem(imageUrls[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Individual Image Item
  Widget _buildImageItem(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
