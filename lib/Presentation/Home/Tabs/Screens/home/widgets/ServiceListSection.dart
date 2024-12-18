import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';

class ServiceListSection extends StatelessWidget {
  final List<ServiceItem> services;

  const ServiceListSection({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Service",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        AppSpacing.medium,
        SizedBox(
          height: 150.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final service = services[index];
              return Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                      child: Image.asset(
                        service.imageUrl,
                        height: 100.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AppSpacing.small,
                    Text(
                      service.title,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ServiceItem {
  final String imageUrl;
  final String title;

  ServiceItem({required this.imageUrl, required this.title});
}
