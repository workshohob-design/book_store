import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_search_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/category/presintation/pages/widgets/my_books_category.dart';
import 'package:flutter/material.dart';

class MyCategoryPage extends StatelessWidget {
  const MyCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MySearchPage()),
            );
          },
          icon: Image.asset(AppIcons.search),
        ),
        title: Text("Category", style: AppTextStyle.H4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.bell_outline),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
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
                Tab(text: "Novels"),
                Tab(text: "Self Love"),
                Tab(text: "Science"),
                Tab(text: "Romantic"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyBooksCategory(),
                  MyBooksCategory(),
                  MyBooksCategory(),
                  MyBooksCategory(),
                  MyBooksCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
