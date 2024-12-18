import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Review/review_section.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  SalonServicesCubit cubit = getIt<SalonServicesCubit>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalonServicesCubit>();
    return    ReviewSection(
          reviews: cubit.reviews,
          onAddReview: () {
            cubit.enterReviewMode();
            // Add review logic here
          },
        );
  }
}
