import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/my_detail_menu_page.dart';
import 'package:flutter/material.dart';

class MyTopOfWeekBookList extends StatelessWidget {
  MyTopOfWeekBookList({super.key});
  // final List items;
  final List<_MM> books = [
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame12),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame13),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame14),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame15),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame16),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top of Week", style: AppTextStyle.H5),
              TextButton(
                onPressed: () {},
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
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final item = books[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 25 : 6, right: 6),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      backgroundColor: AppColors.white,
                      scrollControlDisabledMaxHeightRatio:
                          MediaQuery.of(context).size.height - 120,
                      builder: (context) => MyDetailMenuPage(),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 130,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item.image),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6),
                                Text(
                                  item.name,
                                  style: AppTextStyle.bodyMedium14M.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item.price,
                                  style: AppTextStyle.bodySmall12B.copyWith(
                                    color: AppColors.primary500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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

class _MM {
  final String name;
  final String price;
  final String image;
  _MM({required this.name, required this.price, required this.image});
}
