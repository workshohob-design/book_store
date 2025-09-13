import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyVendorsCategory extends StatelessWidget {
  MyVendorsCategory({super.key});
  final List<String> books = [
    AppImages.Frame1,
    AppImages.Frame2,
    AppImages.Frame3,
    AppImages.Frame4,
    AppImages.Frame5,
    AppImages.Frame6,
    AppImages.Frame7,
    AppImages.Frame8,
  ];
  final List<int> stsrss = [1, 4, 2, 5, 3, 2, 4, 5];
  int star = 5;

  Row starsList(int count) {
    List<bool> stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < count) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Row(
      children: stars.map((e) {
        return Row(
          children: [
            SizedBox(width: 4),
            SizedBox(
              height: 16,
              width: 16,
              child: Image.asset(
                AppIcons.star,
                colorBlendMode: BlendMode.srcIn,
                color: e ? AppColors.yellow : AppColors.greyscale900,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final item = books[index];
          return Padding(
            padding: EdgeInsets.only(top: index <= 3 ? 12 : 16),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyscale50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(item),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Vendors",
                      style: AppTextStyle.bodyLage16M.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    starsList(stsrss[index]),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
