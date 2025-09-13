import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPageViwe extends StatelessWidget {
  MyPageViwe({super.key, required this.controller});
  final PageController controller;
  final List<_PageModel> _images = [
    _PageModel(
      content:
          " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
      path: AppImages.frame,
      title: "Now reading books will be easier",
    ),
    _PageModel(
      content:
          "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
      path: AppImages.frame1,
      title: "Your Bookish Soulmate Awaits",
    ),
    _PageModel(
      content:
          "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
      path: AppImages.frame2,
      title: "Start Your Adventure",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 543,
          child: PageView.builder(
            onPageChanged: (value){
              
            },
            controller: controller,
            hitTestBehavior: HitTestBehavior.translucent,
            itemCount: _images.length,
          
            itemBuilder: (context, index) {
              final item = _images[index];
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      width: double.infinity,
                      child: Image.asset(item.path, fit: BoxFit.fill),
                    ),
                    SizedBox(height: 14),
                    Text(
                      item.title,
                      style: AppTextStyle.H3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      item.content,
                      style: TextStyle(
                        fontSize: 16,
  
                        color: AppColors.greyscale500,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
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
    );
  }
}

class _PageModel {
  final String title;
  final String content;
  final String path;

  _PageModel({required this.content, required this.path, required this.title});
}
