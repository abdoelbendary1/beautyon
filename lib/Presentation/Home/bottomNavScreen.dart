import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/service/service_locator.dart';
import 'package:beautyon/Data/model/bottomAppBarItem.dart';
import 'package:beautyon/Presentation/Home/Tabs/cubit/tab_cubit.dart';
import 'package:beautyon/Presentation/Home/Tabs/tab_widgets_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Account/AccountTabScreen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Booking/BookingScreen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Fav/FavTabScreen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/Service/ServiceTabScreen.dart';
import 'package:beautyon/Presentation/Home/Tabs/Screens/home/HomeTabScreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var cubit = getIt<TabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<TabCubit, TabState>(
        bloc: cubit,
        builder: (context, state) {
          final currentIndex = (state is TabUpdated) ? state.selectedIndex : 0;

          // List of screens for each tab
          final List<Widget> screens = [
            HomeScreen(),
            FavouriteScreen(),
            ServiceScreen(),
            BookingScreen(),
            AccountScreen(),
          ];
          return Scaffold(
            body: screens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.whiteColor,
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<TabCubit>().setTabIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              items: TabHelper().buildBottomNavItems(currentIndex),
            ),
          );
        },
      ),
    );
  }
}
