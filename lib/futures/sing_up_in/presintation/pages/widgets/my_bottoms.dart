import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/material.dart';

class MyBottoms extends StatelessWidget {
  const MyBottoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          MyBottom(
            color: AppColors.white,
            titile: "Sing In with Google",
            onPressed: () {},
            textColor: Colors.black,
            borderSide: AppColors.greyscale200,
          ),
          SizedBox(height: 8),
          MyBottom(
            color: AppColors.white,
            titile: "Sing In with Apple",
            onPressed: () {},
            textColor: Colors.black,
            borderSide: AppColors.greyscale200,
          ),
        ],
      ),
    );
  }
}
