import 'package:beautyon/Core/Utils/Spacing/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:beautyon/Core/Utils/Colors/app_colors.dart';
import 'package:beautyon/Core/Utils/Text/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController? phoneController;
  final String label;
  final String? errorText;
  final String? Function(String?)? validator;

  const PhoneNumberField({
    Key? key,
    this.phoneController,
    required this.label,
    this.errorText,
    this.validator,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String _selectedCountryCode = '+02';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label

        // Phone Number Input Field with Country Code Picker
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(color: AppColors.darkGrayColor, width: 1.5),
            color: AppColors.whiteColor,
          ),
          child: Row(
            children: [
              // Country Code Picker
              Expanded(
                flex: 4,
                child: CountryCodePicker(
                  padding: AppPadding.all(4),
                  textOverflow: TextOverflow.ellipsis,
                  onChanged: (country) {
                    setState(() {
                      _selectedCountryCode = country.dialCode!;
                    });
                  },
                  flagDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  initialSelection: 'EG', // Default country
                  favorite: const ['+02', 'US', 'GB'],
                  showFlag: true,
                  showDropDownButton: true,
                  textStyle: AppTextStyles.normalTextStyle(
                      14.sp, AppColors.blackColor),
                  dialogTextStyle:
                      AppTextStyles.hintStyle.copyWith(fontSize: 14.sp),
                ),
              ),

              // Phone Number Input Field
              Expanded(
                flex: 6,
                child: TextFormField(
                  controller: widget.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    hintText: "Enter your phone number",
                    hintStyle: AppTextStyles.hintStyle.copyWith(
                      color: AppColors.darkGrayColor,
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                    /*  contentPadding: AppPadding.symmetric(
                      horizontal: 0,
                    ), */
                    errorText: widget.errorText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
