import 'package:beautyon/beautyonApp.dart';
import 'package:flutter/material.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:screenutil_module/main.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final String icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.errorText,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText; // Controls password visibility
  late FocusNode _focusNode; // To manage focus state

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField with Focus and Error handling
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: _obscureText,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: AppTextStyles.hintStyle.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
            alignLabelWithHint: false,
            label: Text(
              widget.label,
              /*  style: AppTextStyles.hintStyle.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ), */
            ),
            // Prefix Icon
            prefixIcon:ImageIcon(AssetImage(widget.icon)),

            // Password Visibility Toggle
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.darkGrayColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,

            // Hint Text
            hintText: widget.hintText,
            hintStyle: AppTextStyles.hintStyle.copyWith(
              color: AppColors.darkGrayColor,
              fontSize: 14,
            ),

            // Border Style
            filled: true,
            fillColor: AppColors.whiteColor,
            /*   border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.darkGrayColor,
                width: 0.5,
              ),
            ), */
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.darkGrayColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor, // Border color when focused
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red, // Border color when error
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red, // Focused border color when error
                width: 1.5,
              ),
            ),

            // Error Text
            errorText: widget.errorText,
          ),
        ),
      ],
    );
  }
}
