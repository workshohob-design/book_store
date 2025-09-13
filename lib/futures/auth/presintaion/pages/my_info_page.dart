import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:book_store/futures/auth/presintaion/pages/widgets/my_page_viwe.dart';
import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyInfoPage extends StatefulWidget {
  MyInfoPage({super.key});

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  PageController controller = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyBottom(
                    color: AppColors.white,
                    titile: "Skip",
                    height: 40,
                    width: 80,
                    textColor: AppColors.primary500,
                    onPressed: () {
                      controller.animateToPage(
                        2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOutCirc,
                      );
                    },
                  ),
                ],
              ),
            ),
            MyPageViwe(controller: controller),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyBottom(
                      onPressed: () {
                        print(controller.page);
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOutCirc,
                        );
                      },
                      color: AppColors.primary500,
                      titile: "Continue",
                      height: 56,
                      border: 12,
                    ),
                    SizedBox(height: 8),
                    MyBottom(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MySingInPage(),
                          ),
                        );
                      },
                      color: AppColors.primary50,
                      textColor: AppColors.primary500,
                      titile: "Sing in",
                      height: 56,
                      border: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
