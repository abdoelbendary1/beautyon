import 'package:beautyon/Core/Components/CustomButton.dart';
import 'package:beautyon/Core/Utils/Assets/images/app_images.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Spacing/app_spacing.dart';
import 'package:beautyon/Domain/Entity/salon_entity.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Helpers/about_salon_helper.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Gallery/gallery_tab_screen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Packages/package_screen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/Review/review_screen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/about_tab_content.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/service/ServiceTabScreen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/Screens/Tabs/specialests/specialist_tab_screen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/cubit/salon_services_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/AboutSalon/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenutil_module/main.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import '../widgets/salon_details_container.dart';
import '../widgets/tab_bar_section.dart';

class SalonScreenWithPanel extends StatefulWidget {
  const SalonScreenWithPanel({super.key});

  @override
  State<SalonScreenWithPanel> createState() => _SalonScreenWithPanelState();
}

class _SalonScreenWithPanelState extends State<SalonScreenWithPanel> {
  SalonServicesCubit salonServicesCubit = SalonServicesCubit();

  final List<Widget> tabBodies = [
    const AboutTabContent(),
    const ServiceTabScreen(),
    const SpecialistTabScreen(),
    const GalleryTabScreen(),
    ReviewScreen(),
    const PackageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => salonServicesCubit,
      child: Scaffold(
        backgroundColor: AppColors.lightGray,
        body: SlidingUpPanel(
          backdropTapClosesPanel: true,
          disableDraggableOnScrolling: true,
          parallaxEnabled: true,
          backdropEnabled: true,
          /*         isDraggable: false,
     */
          panelSnapping: true,
          defaultPanelState: PanelState.OPEN,
          panelBuilder: () {
            return _buildPanelBody(context);
          },
          minHeight: MediaQuery.of(context).size.height * 0.4,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          body: const CustomHeaderAbout(),
          /* header: _buildImageHeader(), */
        ),
      ),
    );
  }

  Widget _buildPanelBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            // Salon Details Section
            SalonDetailsContainer(salon: salonServicesCubit.salon),
            // Body Section: Changes dynamically based on the state
            Expanded(
              child: BlocBuilder<SalonServicesCubit, SalonServicesState>(
                builder: (context, state) {
                  if (state is BookingState) {
                    return SalonServicesWidgetHelper()
                        .buildBookingWidget(context);
                  } else if (state is ReviewState) {
                    return SalonServicesWidgetHelper()
                        .buildAddReviewWidget(context);
                  } else {
                    int selectedIndex = 0;
                    if (state is SalonTabChanged) {
                      selectedIndex = state.selectedIndex;
                    }
                    return buildTabs(selectedIndex, context);
                  }
                },
              ),
            ),

            // CustomButton Section: Always remains at the bottom
            BlocBuilder<SalonServicesCubit, SalonServicesState>(
              builder: (context, state) {
                if (state is BookingState) {
                  return CustomButton(
                    text: "Back to Tabs now",
                    onPressed: () {
                      context.read<SalonServicesCubit>().changeTab(0);
                    },
                    isEnabled: true,
                    enabledColor: AppColors.primaryColor,
                  );
                } else if (state is ReviewState) {
                  return CustomButton(
                    text: "Back to Tabs now",
                    onPressed: () {
                      context.read<SalonServicesCubit>().changeTab(0);
                    },
                    isEnabled: true,
                    enabledColor: AppColors.primaryColor,
                  );
                } else {
                  return CustomButton(
                    text: "Book now",
                    onPressed: () {
                      context.read<SalonServicesCubit>().enterBookingMode();
                    },
                    isEnabled: true,
                    enabledColor: AppColors.primaryColor,
                  );
                }
              },
            ),
            AppSpacing.medium
          ],
        ),
      ),
    );
  }

  Widget buildTabs(int selectedIndex, BuildContext context) {
    return Column(
      children: [
        // Tabs Section
        TabBarSection(
          tabs: salonServicesCubit.tabs,
          selectedIndex: selectedIndex,
          onTabChanged: (index) {
            context.read<SalonServicesCubit>().changeTab(index);
          },
        ),
        const Divider(color: AppColors.lightGrayColor, height: 1),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: tabBodies[selectedIndex],
        ),
      ],
    );
  }
}
