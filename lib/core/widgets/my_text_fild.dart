import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextFild extends StatelessWidget {
  const MyTextFild({
    super.key,
    required this.title,
    this.prefix = null,
    this.suffix = null,
    this.validator,
    this.obscureText = false,
    required this.controller,
    this.onChanged = null,
    this.keyboardType = null,
    this.isTitle = true,
    this.borderColor=AppColors.greyscale50
  });
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool isTitle;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitle ? Text(title, style: AppTextStyle.bodyMedium14M) : SizedBox(),
        SizedBox(height: 6),
        TextFormField(
          keyboardType: keyboardType,
          cursorColor: Colors.black,
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.greyscale50,
            hintText: title,
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.greyscale400,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
