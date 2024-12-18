import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalonServicesWidgetHelper {
  // Upper half of the screen with Image Header
  Widget buildImageHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.goldenSalon), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  Widget buildBookingWidget(BuildContext context) {
    return BlocBuilder<SalonServicesCubit, SalonServicesState>(
      builder: (context, state) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Booking Feature Coming Soon!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddReviewWidget(BuildContext context) {
    return BlocBuilder<SalonServicesCubit, SalonServicesState>(
      builder: (context, state) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Review Feature Coming Soon!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}