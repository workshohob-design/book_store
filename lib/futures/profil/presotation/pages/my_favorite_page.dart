import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyFavoritePage extends StatelessWidget {
  MyFavoritePage({super.key});
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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("My Accaunt", style: AppTextStyle.H4),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final item = books[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item.image,fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.name,
                              style: AppTextStyle.bodyLage16M.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              item.price,
                              style: AppTextStyle.bodyMedium14B.copyWith(
                                color: AppColors.primary500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppIcons.love_fill,
                        colorBlendMode: BlendMode.srcIn,
                        color: AppColors.primary500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
  bool isFav = true;
  _MM({required this.name, required this.price, required this.image});
}
