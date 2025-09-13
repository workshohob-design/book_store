import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/my_author_info_page.dart';
import 'package:flutter/material.dart';

class MyAuthorsCategory extends StatelessWidget {
  MyAuthorsCategory({super.key});
  final List<_MM> authors = [
    _MM(
      title: "The Kite Runner",
      content: "American writer he  was the editor of the  ",
      image: AppImages.Frame9,
    ),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Frame10),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Frame11),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Image2),
    _MM(title: "The Kite Runner", content: "Writer", image: AppImages.Image3),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: authors.length,

      itemBuilder: (context, index) {
        final item = authors[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAuthorInfoPage()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 24,
              top: index == 0 ? 40 : 16,
              right: 24,
              bottom: 16,
            ),
            child: Container(
              height: 80,
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(item.image),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Text(
                        item.title,
                        style: AppTextStyle.H5.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        item.content,
                        style: AppTextStyle.bodyMedium14M.copyWith(
                          color: AppColors.greyscale500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MM {
  final String title;
  final String content;
  final String image;
  _MM({required this.title, required this.content, required this.image});
}
