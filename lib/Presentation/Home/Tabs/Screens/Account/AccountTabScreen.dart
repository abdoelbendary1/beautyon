import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Components/reusable_screen.dart';
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Presentation/Home/Tabs/cubit/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenutil_module/main.dart';

class AccountScreen extends StatelessWidget {
  // Initialize sample bookings
  final List<BookingItem> bookings = [];
  AccountScreen({
    Key? key,
  }) : super(key: key);
  TabCubit tabCubit = getIt<TabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ReusableScreen(
            title: "Account",
            prefixIcon: Icons.arrow_back,
            suffixIcon: Icons.refresh,
            onPrefixTap: () => context.read<TabCubit>().setTabIndex(0),
            onSuffixTap: () => print("Refresh clicked"),
            imagePath: AppImages.emptyBooking,
            emptyMessage:
                "Your favorites list is currently empty. Add your favorite items to see them here later.",
            emptyBody: _buildEmptyState(context),
            nonEmptyBody: _buildNonEmptyState(context),
            isEmpty: true,
          ),
        );
      },
    );
  }

  // Empty State Widget
  Widget _buildEmptyState(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        AppSpacing.large, // Top spacing
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              CustomButton(
                text: "Login",
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.signIn,
                  (route) => false,
                ),
                isFilled: true,
                isEnabled: true,
                enabledColor: AppColors.primaryColor,
              ),
              AppSpacing.medium,
              // Outlined Enabled Button
              CustomButton(
                text: "Sign Up",
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.signUp,
                  (route) => false,
                ),
                isFilled: false, // Outlined
                isEnabled: true,
                enabledColor: AppColors.primaryColor,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),

        // Account Settings List
        _buildAccountOptions(context),
        // Logout Button
        _buildLogoutButton(context),
      ],
    ));
  }

  // Non-Empty State Widget
  Widget _buildNonEmptyState(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h), // Top spacing
        // Profile Section
        _buildProfileHeader(),
        SizedBox(height: 20.h),
        // Account Settings List
        _buildAccountOptions(context),
        SizedBox(height: 20.h),
        // Logout Button
        _buildLogoutButton(context),
      ],
    );
  } // Profile Header

  Widget _buildProfileHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 30.r,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with your image asset or network link
            ),
          ),
          SizedBox(width: 16.w),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alaa Ahmed",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Amiraahmed@gmail.com",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Edit Icon
          IconButton(
            icon: Icon(Icons.edit, color: Colors.grey.shade600),
            onPressed: () {
              print("Edit Profile Clicked");
            },
          ),
        ],
      ),
    );
  }

  // Account Options List
  Widget _buildAccountOptions(BuildContext context) {
    return Column(
      children: [
        _buildListItem(
          context,
          title: "Payment Method",
          icon: Icons.payment,
          onTap: () => print("Payment Method Clicked"),
        ),
        _buildListItemWithSwitch(
          context,
          title: "Notification",
          icon: Icons.notifications_none,
          value: false,
          onChanged: (value) => print("Notification: $value"),
        ),
        _buildListItem(
          context,
          title: "Language",
          icon: Icons.language,
          onTap: () => print("Language Clicked"),
        ),
        _buildListItemWithSwitch(
          context,
          title: "Reminder",
          icon: Icons.access_alarm,
          value: true,
          onChanged: (value) => print("Reminder: $value"),
        ),
        _buildListItem(
          context,
          title: "About",
          icon: Icons.info_outline,
          onTap: () => print("About Clicked"),
        ),
        _buildListItem(
          context,
          title: "Privacy Policy",
          icon: Icons.policy_outlined,
          onTap: () => print("Privacy Policy Clicked"),
        ),
        _buildListItem(
          context,
          title: "Delete Account",
          icon: Icons.delete_outline,
          onTap: () => print("Delete Account Clicked"),
        ),
      ],
    );
  }

  // Individual List Item
  Widget _buildListItem(BuildContext context,
      {required String title, required IconData icon, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(
        title,
        style: AppTextStyles.normalTextStyle(18.sp, AppColors.blackColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.grey),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
      visualDensity: VisualDensity.compact,
    );
  }

  // List Item with Toggle Switch
  Widget _buildListItemWithSwitch(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey.shade600),
        title: Text(
          title,
          style: AppTextStyles.normalTextStyle(18.sp, AppColors.blackColor),
        ),
        trailing: Switch(
          value: value,
          activeColor: Colors.purple,
          onChanged: onChanged,
        ),
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      ),
    );
  }

  // Logout Button
  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListTile(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.signIn,
          (route) => false,
        ),
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text(
          "Log out",
          style: AppTextStyles.normalTextStyle(18.sp, AppColors.redColor),
        ),
      ),
    );
  }
}

// Booking Item Model
class BookingItem {
  final String imageUrl;
  final String title;
  final String description;

  BookingItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
