import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/home/presintation/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class MyCongratulationPage extends StatelessWidget {
  const MyCongratulationPage({
    super.key,
    required this.title,
    required this.content,
    required this.bottomText,
  });
  final String title;
  final String content;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  child: Image.asset(AppImages.ending, fit: BoxFit.cover),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(title, style: AppTextStyle.H3),
            SizedBox(height: 8),
            Text(
              content,
              style: AppTextStyle.bodyLage16R.copyWith(
                color: AppColors.greyscale500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            MyBottom(
              color: AppColors.primary500,
              titile: bottomText,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
