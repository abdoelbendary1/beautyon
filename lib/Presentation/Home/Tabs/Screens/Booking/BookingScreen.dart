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

class BookingScreen extends StatelessWidget {
  // Initialize sample bookings
  final List<BookingItem> bookings = [];
  BookingScreen({
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
            title: "My Booking",
            prefixIcon: Icons.arrow_back,
            suffixIcon: Icons.refresh,
            onPrefixTap: () => context.read<TabCubit>().setTabIndex(0),
            onSuffixTap: () => print("Refresh clicked"),
            imagePath: AppImages.emptyBooking,
            emptyMessage:
                "There is currently no reservation on this page. You can add your desired reservation now.",
            emptyBody: _buildLoginState(context),
            nonEmptyBody: _buildNonEmptyState(),
            isEmpty: true,
          ),
        );
      },
    );
  }

  // Empty State Widget
  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.emptyBooking, // Add your image path
          /*  height: 400,
          width: 400, */
        ),
        const SizedBox(height: 20),
        const Text(
          "There is currently no reservation on this page. You can add your desired reservation now.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildLoginState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.emptyBooking, // Add your image path
          /*  height: 400,
          width: 400, */
        ),
        AppSpacing.large,
        Text(
          "Login to View Your Booking",
          textAlign: TextAlign.center,
          style: AppTextStyles.titleStyle,
        ),
        AppSpacing.large,
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
              AppSpacing.medium,
            ],
          ),
        ),
      ],
    );
  }

  // Non-Empty State Widget
  Widget _buildNonEmptyState() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(booking.imageUrl),
              radius: 30,
            ),
            title: Text(
              booking.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              booking.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                print("Delete ${booking.title}");
              },
            ),
          ),
        );
      },
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
