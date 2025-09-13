import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/material.dart';

class MyDetailMenuPage extends StatefulWidget {
  MyDetailMenuPage({super.key});

  @override
  State<MyDetailMenuPage> createState() => _MyDetailMenuPageState();
}

class _MyDetailMenuPageState extends State<MyDetailMenuPage> {
  bool isFav = false;
  int count = 0;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                AppIcons.star,
                colorBlendMode: BlendMode.srcIn,
                color: e ? AppColors.yellow : AppColors.greyscale900,
              ),
            ),
            SizedBox(width: 4),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 320,
                  child: Image.asset(AppImages.Frame, fit: BoxFit.cover),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("The Kite Runner", style: AppTextStyle.H4),
                IconButton(
                  onPressed: () {
                    isFav = !isFav;
                    setState(() {});
                  },
                  icon: SizedBox(
                    height: 24,
                    child: isFav
                        ? Image.asset(
                            AppIcons.love_fill,
                            colorBlendMode: BlendMode.srcIn,
                            color: AppColors.primary500,
                          )
                        : Image.asset(
                            AppIcons.love_fill,
                            colorBlendMode: BlendMode.srcIn,
                            color: AppColors.greyscale500,
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(children: [Image.asset(AppImages.Frame4)]),
            SizedBox(height: 12),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra dignissim ac ac ac. Nibh et sed ac, eget malesuada.",
              style: AppTextStyle.bodyMedium14R.copyWith(
                color: AppColors.greyscale500,
              ),
            ),
            SizedBox(height: 24),
            Text("Review", style: AppTextStyle.H5),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsList(4),
                Text(" (4.0)", style: AppTextStyle.bodyLage16S),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.greyscale50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (count > 0) {
                            count--;
                            setState(() {});
                          }
                        },
                        icon: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(AppIcons.less, fit: BoxFit.cover),
                        ),
                      ),
                      Text("$count", style: AppTextStyle.bodyLage16M),
                      IconButton(
                        onPressed: () {
                          if (count < 10) {
                            count++;
                            setState(() {});
                          }
                        },
                        icon: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(AppIcons.add, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  '39.14',
                  style: AppTextStyle.bodyLage16M.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBottom(
                  color: AppColors.primary500,
                  titile: "Continue shopping",
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width / 2,
                  textStyle: AppTextStyle.H6.copyWith(),
                  textColor: AppColors.white,
                ),
                MyBottom(
                  color: AppColors.greyscale50,
                  titile: "View cart",
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width / 3.3,
                  textStyle: AppTextStyle.H6.copyWith(),
                  textColor: AppColors.primary500,
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}