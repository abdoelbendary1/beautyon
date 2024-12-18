import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../Core/Utils/Assets/icons/app_icons.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Color iconColor;
  final Color fillColor;
  final Function(String) onSearchChanged;

  const SearchBarWidget({
    Key? key,
    this.hintText = "Search...",
    this.borderColor = Colors.purple,
    this.iconColor = Colors.white,
    this.fillColor = Colors.transparent,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onSearchChanged,
        style: TextStyle(color: iconColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: iconColor),
          prefixIcon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              iconColor, // Choose your desired color
              BlendMode
                  .srcIn, // This mode makes the image color match the filter
            ),
            child: ImageIcon(
              AssetImage(AppIcons.search),
            ),
          ),

          /*  Icon(FontAwesomeIcons.search, color: iconColor), */
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: borderColor.withOpacity(0.8), width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        ),
      ),
    );
  }
}
