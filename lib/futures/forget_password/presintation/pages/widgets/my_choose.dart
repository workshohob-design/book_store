import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyChoose extends StatelessWidget {
  const MyChoose({
    super.key,
    required this.which,
    required this.onTap,
    required this.onTap2,
  });
  final bool which;
  final void Function()? onTap;
  final void Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap2,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.greyscale50,
                border: Border.all(
                  color: which == false
                      ? AppColors.primary500
                      : Colors.transparent, // highlight only when selected
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      which == false ? AppIcons.group9342 : AppIcons.group934,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: AppTextStyle.bodyMedium14M),
                        Text(
                          "Send to your email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyscale500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.greyscale50,
                border: Border.all(
                  color: which == true
                      ? AppColors.primary500
                      : Colors.transparent, // highlight only when selected
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      which == true ? AppIcons.Group9352 : AppIcons.Group935,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone", style: AppTextStyle.bodyMedium14M),
                        Text(
                          "Send to your phone",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyscale500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
