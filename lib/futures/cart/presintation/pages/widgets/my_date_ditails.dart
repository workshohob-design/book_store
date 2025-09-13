import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/cart/presintation/pages/widgets/my_ditails_model.dart';
import 'package:flutter/material.dart';

class MyDateDitails extends StatelessWidget {
  const MyDateDitails({super.key});

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
          scrollControlDisabledMaxHeightRatio:480,
          builder: (context) => MyDitailsModel(dateNow: '12 mart',),
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
            Row(children: [Text("Date and time", style: AppTextStyle.H5)]),
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
                      AppIcons.calendar,
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
                      Text("Date & time", style: AppTextStyle.bodyLage16S),
                      Text(
                        "Choose date and time ",
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
