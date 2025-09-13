import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyAuthorInfoPage extends StatelessWidget {
  MyAuthorInfoPage({super.key});

  final List<_MM> books = [
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame12),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame13),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame14),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame15),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame16),
  ];

  Row starsList(int count) {
    List<bool> stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < count) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars.map((e) {
        return Row(
          children: [
            SizedBox(width: 4),
            SizedBox(
              height: 28,
              width: 28,
              child: Image.asset(
                AppIcons.star,
                colorBlendMode: BlendMode.srcIn,
                color: e ? AppColors.yellow : AppColors.greyscale900,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Author", style: AppTextStyle.H4),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.Image3),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Novelist",
                  style: AppTextStyle.bodyLage16R.copyWith(
                    color: AppColors.greyscale500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Tess Gunty", style: AppTextStyle.H4)],
            ),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                starsList(4),
                SizedBox(width: 10),
                Text("(4.0)", style: AppTextStyle.H5),
              ],
            ),
            SizedBox(height: 22),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About", style: AppTextStyle.H6),
                SizedBox(height: 8),
                Text(
                  "Gunty was born and raised in South Bend, Indiana.She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University.",
                  style: AppTextStyle.bodyLage16R.copyWith(
                    color: AppColors.greyscale500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Text("Products", style: AppTextStyle.H6),
            GridView.builder(
              shrinkWrap: true,
              itemCount: books.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 230,
                crossAxisSpacing: 10,
              ),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),
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
          ],
        ),
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
