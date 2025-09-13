import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/material.dart';

class MyBalsOfOederPage extends StatefulWidget {
  MyBalsOfOederPage({super.key});

  @override
  State<MyBalsOfOederPage> createState() => _MyBalsOfOederPageState();
}

class _MyBalsOfOederPageState extends State<MyBalsOfOederPage> {
  int countOfStar = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppImages.ending)],
            ),
            SizedBox(height: 24),
            Text("You Received The Order!", style: AppTextStyle.H3),
            SizedBox(height: 8),
            Text(
              "#02391238091",
              style: AppTextStyle.bodyLage16R.copyWith(
                color: AppColors.greyscale500,
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: 230,
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tell us your feedback 🙌',
                    style: AppTextStyle.H5.copyWith(
                      color: AppColors.primary500,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Dignissim magna vitae.',
                    style: AppTextStyle.bodyLage16R.copyWith(
                      color: AppColors.primary500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 32,
                        child: ListView.builder(
                          addSemanticIndexes: true,
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                countOfStar = index;
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                height: 32,
                                width: 32,
                                child: Image.asset(
                                  AppIcons.star,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.srcIn,
                                  color: countOfStar >= index
                                      ? AppColors.yellow
                                      : AppColors.greyscale400,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Write something for us!",
                    style: AppTextStyle.bodyLage16R,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            MyBottom(color: AppColors.primary500, titile: "Done", onPressed: (){})
          ],
        ),
      ),
    );
  }
}
