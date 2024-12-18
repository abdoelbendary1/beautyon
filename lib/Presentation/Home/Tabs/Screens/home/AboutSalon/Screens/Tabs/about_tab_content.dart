import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import '../../widgets/working_hour_row.dart';

class AboutTabContent extends StatelessWidget {
  const AboutTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Us',
                style: AppTextStyles.boldTextStyle(18, AppColors.blackColor)),
            AppSpacing.small,
            Text(
              'Welcome to Golden Glow, your ultimate destination for beauty and complete care. We offer a comprehensive range of services...',
              style: AppTextStyles.normalTextStyle(14, AppColors.darkGrayColor),
            ),
            AppSpacing.large,
            Text('Working Hours',
                style: AppTextStyles.boldTextStyle(18, AppColors.blackColor)),
            AppSpacing.small,
            const WorkingHourRow(
                day: 'Saturday', hours: 'Closed', isClosed: true),
            const WorkingHourRow(day: 'Sunday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Monday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Sunday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Monday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Sunday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Monday', hours: '10 Am - 1 Am'),
            const WorkingHourRow(day: 'Sunday', hours: '10 Am - 1 Am'),
          ],
        ),
      ),
    );
  }
}
