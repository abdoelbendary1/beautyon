import 'package:beautyon/Core/Utils/Assets/icons/app_icons.dart';
import 'package:beautyon/Data/model/bottomAppBarItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabHelper {
  List<BottomNavigationBarItem> buildBottomNavItems(int currentIndex) {
    final items = [
      BottomNavItem(
        label: 'Home',
        selectedIconPath: AppIcons.home_selected,
        unselectedIconPath: AppIcons.home_unselected,
        index: 0,
      ),
      BottomNavItem(
        label: 'Favourite',
        selectedIconPath: AppIcons.fav_selected,
        unselectedIconPath: AppIcons.fav_unselected,
        index: 1,
      ),
      BottomNavItem(
        label: 'Service',
        selectedIconPath: AppIcons.service_selected,
        unselectedIconPath: AppIcons.service_unselected,
        index: 2,
      ),
      BottomNavItem(
        label: 'Booking',
        selectedIconPath: AppIcons.booking_selected,
        unselectedIconPath: AppIcons.booking_unselected,
        index: 3,
      ),
      BottomNavItem(
        label: 'Account',
        selectedIconPath: AppIcons.account_selected,
        unselectedIconPath: AppIcons.account_unselected,
        index: 4,
      ),
    ];

    return items.map((item) {
      return BottomNavigationBarItem(
        icon: _buildSvgIcon(
          selectedPath: item.selectedIconPath,
          unselectedPath: item.unselectedIconPath,
          isSelected: currentIndex == item.index,
        ),
        label: item.label,
      );
    }).toList();
  }

  Widget _buildSvgIcon(
      {required String selectedPath,
      required String unselectedPath,
      required bool isSelected}) {
    return SvgPicture.asset(
      isSelected ? selectedPath : unselectedPath,
      width: 24,
      height: 24,
    );
  }
}
