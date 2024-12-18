import 'package:beautyon/Core/Components/custom_app_bar.dart';
import 'package:beautyon/Core/Components/empty_state_body.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Booking/service_list_body.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/widgets/ServiceListSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableScreen extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final VoidCallback onPrefixTap;
  final VoidCallback onSuffixTap;
  final String imagePath;
  final String emptyMessage;
  Widget emptyBody;
  Widget nonEmptyBody;
  bool isEmpty;

  ReusableScreen({
    Key? key,
    required this.title,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onPrefixTap,
    required this.onSuffixTap,
    required this.imagePath,
    required this.emptyMessage,
    required this.emptyBody,
    required this.nonEmptyBody,
    required this.isEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          CustomAppBar(
            title: title,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            onPrefixTap: onPrefixTap,
            onSuffixTap: onSuffixTap,
          ),
          Expanded(
            flex: 9,
            child: isEmpty ? emptyBody : nonEmptyBody,
          ),
        ],
      ),
    );
  }
}
