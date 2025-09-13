import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/cart/presintation/pages/widgets/my_date_ditails.dart';
import 'package:book_store/futures/cart/presintation/pages/widgets/my_payme_ditails.dart';
import 'package:book_store/futures/cart/presintation/pages/widgets/my_price_ditails.dart';
import 'package:flutter/material.dart';

class MyConfirmOrderPage extends StatelessWidget {
  const MyConfirmOrderPage({super.key});
  final String shortLocName = 'Utama Street No.20';
  final String fullLocName =
      "Dumbo Street No.20, Dumbo, New York 10001, United States";

  @override
  Widget build(BuildContext context) {
    double price = 89.34;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
        title: Text("Confirm Order", style: AppTextStyle.H4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.bell_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(color: AppColors.greyscale200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [Text("Address", style: AppTextStyle.H5)]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.greyscale50,
                        radius: 22,
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            AppIcons.location_fill,
                            colorBlendMode: BlendMode.srcIn,
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shortLocName, style: AppTextStyle.bodyLage16S),
                            Text(
                              fullLocName,
                              style: AppTextStyle.bodyMedium14R.copyWith(
                                overflow: TextOverflow.visible,
                                color: AppColors.greyscale500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(AppIcons.chevron_right),
                          ),
                        ],
                      ),
                    ],
                  ),
                  MyBottom(
                    width: 110,
                    height: 40,
                    color: AppColors.greyscale50,
                    titile: "Change",
                    textColor: AppColors.primary500,
                    // textStyle: AppTextStyle.bodyMedium14B,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            MyPriceDitails(),
            SizedBox(height: 16),
            MyDateDitails(),
            SizedBox(height: 16),
            MyPaymeDitails(),
            SizedBox(height: 30),
            MyBottom(
              color: AppColors.primary500,
              titile: "Order",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
