import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_promo_code.dart';
import 'package:book_store/futures/home/presintation/pages/my_home_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_favorite_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_hrlp_center_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_my_account_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_order_history_page.dart';
import 'package:book_store/futures/profil/presotation/pages/widgets/my_log_out_model.dart';
import 'package:flutter/material.dart';

class MyProfilPage extends StatelessWidget {
  MyProfilPage({super.key});
  final List<_MM> settings = [
    _MM(title: "My Account", page: MyMyAccountPage(), path: AppIcons.profile_fill),
    _MM(title: "Address", page: MyHomePage(), path: AppIcons.location_fill),
    _MM(title: "Offers & Promos", page: MyPromoCodePage(), path: AppIcons.fire),
    _MM(title: "Your Favorites", page: MyFavoritePage(), path: AppIcons.love_fill),
    _MM(title: "Order History", page: MyOrderHistoryPage(), path: AppIcons.calendar),
    _MM(title: "Help Center", page: MyHelpCenterPage(), path: AppIcons.chat_fill),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text("Location", style: AppTextStyle.H4),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Divider(color: const Color.fromRGBO(232, 232, 232, 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary200,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Text("Name", style: AppTextStyle.H6),
                        Text(
                          "88 136 80 02",
                          style: AppTextStyle.bodyMedium14R.copyWith(
                            color: AppColors.greyscale500,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          showDragHandle: true,
                          backgroundColor: AppColors.white,
                          scrollControlDisabledMaxHeightRatio: 320,
                          builder: (context) => MyLogOutModel(),
                        );
                      },
                      child: Text(
                        "Logout",
                        style: AppTextStyle.bodyMedium14B.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.greyscale200),
          ListView.builder(
            shrinkWrap: true,
            itemCount: settings.length,
            itemBuilder: (context, index) {
              final item = settings[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item.page),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColors.primary50,
                            child: Image.asset(
                              item.path,
                              colorBlendMode: BlendMode.srcIn,
                              color: AppColors.primary500,
                            ),
                          ),
                          SizedBox(width: 16),

                          Text(item.title, style: AppTextStyle.H6),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Image.asset(
                              AppIcons.chevron_right,
                              colorBlendMode: BlendMode.srcIn,
                              color: AppColors.greyscale500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MM {
  final String title;
  final String path;
  final Widget page;
  _MM({required this.title, required this.page, required this.path});
}
