import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_border_radius.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/ServiceListSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceListBody extends StatelessWidget {
  final List<ServiceItem> services;

  const ServiceListBody({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPadding.symmetric(horizontal: 16, vertical: 8),
      itemCount: services.length,
      separatorBuilder: (_, __) => AppSpacing.medium,
      itemBuilder: (context, index) {
        final service = services[index];
        return Container(
          padding: AppPadding.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: AppBorderRadius.small,
                child: Image.network(
                  service.imageUrl,
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
              AppSpacing.medium,
              Expanded(
                child: Text(service.title,
                    style:
                        AppTextStyles.boldTextStyle(16, AppColors.blackColor)),
              ),
            ],
          ),
        );
      },
    );
  }
}
