import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_baners.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({super.key});
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: MyBottom(
          color: AppColors.primary500,
          titile: "Confirm Order",
          onPressed: () {},
          height: 58,
          border: 15,
          textStyle: AppTextStyle.H6.copyWith(color: AppColors.white),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text("Cart", style: AppTextStyle.H4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.bell_outline),
          ),
        ],
      ),
      body: books.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset(AppImages.emtpy_cart),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("There is no products", style: AppTextStyle.H6),
                  ],
                ),
              ],
            )
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final item = books[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.greyscale100),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: AppTextStyle.H5),
                          Text(
                            item.price,
                            style: AppTextStyle.H6.copyWith(
                              color: AppColors.primary500,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_sweep,
                                size: 28,
                                color: AppColors.red,
                              ),
                            ),
                          ],
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
