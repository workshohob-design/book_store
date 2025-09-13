import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyBooksCategory extends StatelessWidget {
  MyBooksCategory({super.key});
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisExtent: 225,
          crossAxisCount: 2,
        ),itemCount: books.length,
        itemBuilder: (context, index) {
          final item = books[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(child: Image.asset(item.image, fit: BoxFit.cover),borderRadius: BorderRadius.circular(8),),
                ),
                SizedBox(height: 8),
                Text(item.name, style: AppTextStyle.bodyLage16M),
                SizedBox(height: 4),
                Text(
                  item.price,
                  style: AppTextStyle.bodyMedium14B.copyWith(
                    color: AppColors.primary500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MM {
  final String name;
  final String price;
  final String image;
  _MM({required this.name, required this.price, required this.image});
}
