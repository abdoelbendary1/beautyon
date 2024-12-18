import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSlider extends StatefulWidget {
  final List<String> imageUrls; // List of image URLs
  final double aspectRatio;
  final bool autoPlay;
  final double borderRadius;

  const CustomSlider({
    Key? key,
    required this.imageUrls,
    this.aspectRatio = 16 / 9,
    this.autoPlay = true,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0; // Track the current active index
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return _buildImage(widget.imageUrls[index]);
          },
          options: CarouselOptions(
            autoPlay: widget.autoPlay,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: widget.aspectRatio,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        AppSpacing.small,
        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0.w,
                height: 12.0.h,
                margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? AppColors.primaryColor
                      : AppColors.darkGrayColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
        width: double.infinity,
        /*    loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                      (progress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }, */
        errorBuilder: (context, error, stackTrace) => Container(
          width: double.infinity,
          color: Colors.grey[300],
          child: const Icon(
            Icons.broken_image,
            color: Colors.grey,
            size: 50,
          ),
        ),
      ),
    );
  }
}
