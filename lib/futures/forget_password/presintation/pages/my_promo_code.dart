import 'dart:math';

import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/material.dart';

class MyPromoCodePage extends StatelessWidget {
  MyPromoCodePage({super.key});
  List<int> promos = [50, 80, 20];
  final Random _random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      244,
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("Offers & Promos", style: AppTextStyle.H4),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text("You Have ${promos.length} Copons to use",style: AppTextStyle.H5,),
            SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: promos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getRandomColor()
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${promos[index]}%",
                        style: AppTextStyle.H2.copyWith(color: AppColors.white),
                      ),
                      Text(
                        "OFF",
                        style: AppTextStyle.H2.copyWith(color: AppColors.white),
                      ),
                      MyBottom(
                        color: AppColors.white,
                        titile: "Copy",
                        onPressed: () {},
                        height: 35,
                        width: 95,
                        textStyle: AppTextStyle.bodyMedium14B
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
