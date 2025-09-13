import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/futures/cart/presintation/pages/my_cart_page.dart';
import 'package:book_store/futures/category/presintation/pages/my_category_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_home_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_profil_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  List pages = [MyHomePage(), MyCategoryPage(), MyCartPage(), MyProfilPage()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        showUnselectedLabels: true,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        selectedItemColor: AppColors.primary500,
        unselectedItemColor: AppColors.greyscale500,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.home_fill,
              colorBlendMode: BlendMode.srcIn,
              color: index != 0 ? AppColors.greyscale500 : AppColors.primary500,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.menu_fill,
              colorBlendMode: BlendMode.srcIn,
              color: index != 1 ? AppColors.greyscale500 : AppColors.primary500,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.cart_fill,
              colorBlendMode: BlendMode.srcIn,
              color: index != 2 ? AppColors.greyscale500 : AppColors.primary500,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.profile_fill,
              colorBlendMode: BlendMode.srcIn,
              color: index != 3 ? AppColors.greyscale500 : AppColors.primary500,
            ),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
