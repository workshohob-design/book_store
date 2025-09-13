import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyBaners extends StatelessWidget {
  const MyBaners({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 162,
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            padEnds: false,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  top: 8,
                  left: 23,
                  right: 23,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary50,
                  ),
                  height: 146,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Special Offer", style: AppTextStyle.H4),
                                Text(
                                  "Discount 25%",
                                  style: AppTextStyle.bodyMedium14R,
                                ),
                              ],
                            ),
                            MyBottom(
                              color: AppColors.primary500,
                              titile: "Order Now",
                              textStyle: AppTextStyle.bodyMedium14B.copyWith(
                                color: AppColors.white,
                              ),
                              onPressed: () {},
                              height: 42,
                              width: 130,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 146,
                        width: 110,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            AppImages.Image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ScaleEffect(
                scale: 3.0,
                dotHeight: 4.0,
                dotWidth: 4.0,
                activeDotColor: AppColors.primary500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
