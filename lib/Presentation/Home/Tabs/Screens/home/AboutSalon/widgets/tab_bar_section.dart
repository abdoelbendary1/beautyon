import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;

  const TabBarSection({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tabs.asMap().entries.map((entry) {
            int idx = entry.key;
            String tab = entry.value;

            return GestureDetector(
              onTap: () => onTabChanged(idx),
              child: Padding(
                padding: AppPadding.medium,
                child: Text(
                  tab,
                  style: AppTextStyles.normalTextStyle(
                    14,
                    selectedIndex == idx
                        ? AppColors.primaryColor
                        : AppColors.darkGrayColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
