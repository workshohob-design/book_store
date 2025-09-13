import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_vendors_category.dart';
import 'package:flutter/material.dart';

class MyVendorsPage extends StatelessWidget {
  const MyVendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendors", style: AppTextStyle.H4),
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
        length: 5,
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
                children: [
                  Column(
                    children: [
                      Text(
                        "  Our Vendors",
                        style: AppTextStyle.bodyLage16R.copyWith(
                          color: AppColors.greyscale500,
                        ),
                      ),
                      Text(
                        "Vendors",
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
                Tab(text: "Books"),
                Tab(text: "Poems"),
                Tab(text: "Special for you"),
                Tab(text: "Stationary"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyVendorsCategory(),
                  MyVendorsCategory(),
                  MyVendorsCategory(),
                  MyVendorsCategory(),
                  MyVendorsCategory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
