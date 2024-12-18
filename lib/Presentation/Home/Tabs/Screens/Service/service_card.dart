import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/ServiceScreenDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Data/model/serviceEntity.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;
  final VoidCallback onAddToFavorites;
  final VoidCallback onBookNow;

  const ServiceCard({
    Key? key,
    required this.service,
    required this.onAddToFavorites,
    required this.onBookNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context, service),
      child: Card(
        elevation: 0,
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 130.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImage(),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, ServiceEntity service) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceDetailsScreen(
            service: service,
          ),
        )
        /*  AppRoutes.serviceDetails,
      arguments: service, */
        );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      ),
      child: Image.asset(
        service.imageUrl!,
        width: 120.w,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            _buildLocationAndDate(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            service.title ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: onAddToFavorites,
          icon: FaIcon(
            FontAwesomeIcons.heart,
            size: 16.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndDate() {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 14, color: Colors.grey),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            "${service.location}, ${service.date}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        _buildRatingStars(),
        const Spacer(),
        _buildBookNowButton(),
      ],
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < (service.rating?.floor() ?? 0)
              ? Icons.star
              : Icons.star_border,
          color: Colors.purple,
          size: 14.sp,
        );
      }),
    );
  }

  Widget _buildBookNowButton() {
    return CustomButton(
      height: 30.h,
      text: "Book now",
      borderRadius: 12.r,
      enabledColor: AppColors.primaryColor,
      isFilled: true,
      isEnabled: true,
      onPressed: onBookNow,
      textStyle: AppTextStyles.normalTextStyle(12, AppColors.whiteColor),
      textColor: AppColors.whiteColor,
      width: 120.w,
    );
  }
}
