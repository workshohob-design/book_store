import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:flutter/material.dart';

class MyLogOutModel extends StatelessWidget {
  MyLogOutModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        // Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        child: Column(
          children: [
            Row(children: [Text("Logout", style: AppTextStyle.H5)]),
            SizedBox(height: 16),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: AppTextStyle.bodyLage16R,
            ),
            SizedBox(height: 24),
            MyBottom(
              border: 16,
              height: 58,
              color: AppColors.primary500,
              titile: "Logout",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MySingInPage()),
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 10),
            MyBottom(
              height: 58,
              border: 16,
              color: AppColors.primary50,
              titile: "Cancel",
              textColor: AppColors.primary500,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


