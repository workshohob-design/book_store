import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/my_vendors_page.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_vendors_category.dart';
import 'package:flutter/material.dart';

class MyVendorsList extends StatelessWidget {
  MyVendorsList({super.key});
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 24,
            right: 24,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best Vendors", style: AppTextStyle.H5),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyVendorsPage(),
                    ),
                  );
                },
                child: Text(
                  "See all",
                  style: AppTextStyle.bodyMedium14B.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final item = books[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 25 : 12),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.greyscale50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(item),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
