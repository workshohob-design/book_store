import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyHelpCenterPage extends StatelessWidget {
  const MyHelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary500,
        title: Text(
          "Help Center",
          style: AppTextStyle.H4.copyWith(color: AppColors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            AppIcons.arrow_left_outline,
            colorBlendMode: BlendMode.srcIn,
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primary500,
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Help Center",
                    style: AppTextStyle.H3.copyWith(color: AppColors.white),
                  ),
                  Text(
                    "Tell us how we can help 👋",
                    style: AppTextStyle.bodyLage16R.copyWith(
                      color: AppColors.primary200,
                    ),
                  ),
                  Text(
                    "Chapter are standing by for service & support!",
                    style: AppTextStyle.bodyLage16R.copyWith(
                      color: AppColors.primary200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.greyscale50,
                            border: Border.all(
                              color: AppColors.greyscale100, // highlight only when selected
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppIcons.group9342),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: AppTextStyle.bodyMedium14M,
                                    ),
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
                    SizedBox(width: 20),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.greyscale50,
                            border: Border.all(
                              color: AppColors.greyscale100,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppIcons.Group9352),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone",
                                      style: AppTextStyle.bodyMedium14M,
                                    ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
