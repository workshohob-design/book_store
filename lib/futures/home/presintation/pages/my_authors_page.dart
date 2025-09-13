import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_authors_category.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_vendors_category.dart';
import 'package:flutter/material.dart';

class MyAuthorsPage extends StatelessWidget {
  const MyAuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authors", style: AppTextStyle.H4),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppIcons.search)),
        ],
      ),
      backgroundColor: AppColors.white,
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 16,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check the authors",
                        style: AppTextStyle.bodyLage16R.copyWith(
                          color: AppColors.greyscale500,
                        ),
                      ),
                      Text(
                        "Authors",
                        style: AppTextStyle.H4.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              unselectedLabelColor: AppColors.greyscale500,
              labelStyle: AppTextStyle.H5,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelStyle: AppTextStyle.bodyLage16R.copyWith(
                color: AppColors.greyscale500,
              ),
              isScrollable: true,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Poets"),
                Tab(text: "Novelists"),
                Tab(text: "Journalists"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyAuthorsCategory(),
                  MyAuthorsCategory(),
                  MyAuthorsCategory(),
                  MyAuthorsCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
