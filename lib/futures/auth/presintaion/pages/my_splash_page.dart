import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/futures/auth/presintaion/pages/my_info_page.dart';
import 'package:flutter/material.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({super.key});

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyInfoPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Center(child: Image.asset(AppImages.logo)),
    );
  }
}
