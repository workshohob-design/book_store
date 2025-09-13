import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/my_authors_page.dart';
import 'package:flutter/material.dart';

class MyAuthrosList extends StatelessWidget {
  MyAuthrosList({super.key});
  final List<_MM> books = [
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Frame9),
    _MM(
      title: "The Kite Runnervjvjhvjhvjhvvhvjhjvjh",
      content: "Writer",
      image: AppImages.Frame10,
    ),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Frame11),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Image2),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Image3),
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
              Text("Authors", style: AppTextStyle.H5),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAuthorsPage()));
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
          height: 165,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final item = books[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 25 : 6, right: 6),
                child: Container(
                  height: 165,
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          foregroundImage: AssetImage(item.image),
                          radius: 50,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 130,
                        child: Text(
                          item.title,
                          style: AppTextStyle.bodyLage16M.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.content,
                        style: AppTextStyle.bodyMedium14R.copyWith(
                          color: AppColors.greyscale500,
                        ),
                      ),
                    ],
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
  final String title;
  final String content;
  final String image;
  _MM({required this.title, required this.content, required this.image});
}
