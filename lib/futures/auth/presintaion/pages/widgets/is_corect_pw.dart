import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyIsCorectPw extends StatelessWidget {
  MyIsCorectPw({super.key, required this.isTrue, required this.controller});
  final bool isTrue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return isTrue
        ? Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    RegExp(r'^.{8,}$').hasMatch(controller.text)
                        ? AppIcons.check
                        : AppIcons.x,
                    color: RegExp(r'^.{8,}$').hasMatch(controller.text)
                        ? AppColors.blue
                        : AppColors.red,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Minimum 8 characters",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    RegExp(r'^(?=.*[0-9]).{8,}$').hasMatch(controller.text)
                        ? AppIcons.check
                        : AppIcons.x,
                    color:
                        RegExp(r'^(?=.*[0-9]).{8,}$').hasMatch(controller.text)
                        ? AppColors.blue
                        : AppColors.red,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Atleast 1 number (1-9)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    RegExp(r'^(?=.*[A-Za-z]).+$').hasMatch(controller.text)
                        ? AppIcons.check
                        : AppIcons.x,
                    color:
                        RegExp(r'^(?=.*[A-Za-z]).+$').hasMatch(controller.text)
                        ? AppColors.blue
                        : AppColors.red,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Atleast lowercase or uppercase letters",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          )
        : SizedBox();
  }
}
