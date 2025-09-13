// import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_search_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_authros_list.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_baners.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_top_of_week_book_list.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_venders_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final PageController pageController = PageController();

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
        title: Text("Home", style: AppTextStyle.H4),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.bell_outline),
          ),
        ],
      ),
      body: ListView(
        children: [
          MyBaners(controller: pageController),
          MyTopOfWeekBookList(),
          MyVendorsList(),
          MyAuthrosList(),
        ],
      ),
    );
  }
}
