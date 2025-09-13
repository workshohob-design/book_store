import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyPaymeDitails extends StatelessWidget {
  const MyPaymeDitails({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          showDragHandle: true,
          backgroundColor: AppColors.white,
          scrollControlDisabledMaxHeightRatio:
              MediaQuery.sizeOf(context).height - 100,
          builder: (context) => Container(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.greyscale200),
                    ),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.asset("")
                            Text("Credit Card", style: AppTextStyle.H6),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(AppIcons.chevron_right)],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(color: AppColors.greyscale200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [Text("Payment", style: AppTextStyle.H5)]),

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
                      AppIcons.card_outline,
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
                      Text("Payment", style: AppTextStyle.bodyLage16S),
                      Text(
                        "Choose your payment",
                        style: AppTextStyle.bodyMedium14R.copyWith(
                          overflow: TextOverflow.visible,
                          color: AppColors.greyscale500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Image.asset(AppIcons.chevron_right)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
