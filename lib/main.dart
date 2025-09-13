import 'package:book_store/futures/auth/presintaion/pages/my_info_page.dart';
import 'package:book_store/core/pages/my_code_page.dart';
import 'package:book_store/core/pages/my_congratulation_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my-enter_phone_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_enter_email_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_forget_password_page.dart';
import 'package:book_store/futures/auth/presintaion/pages/my_splash_page.dart';
import 'package:book_store/core/pages/my_search_page.dart';
import 'package:book_store/futures/cart/presintation/pages/my_add_loc_page.dart';
import 'package:book_store/futures/cart/presintation/pages/my_cart_page.dart';
import 'package:book_store/futures/cart/presintation/pages/my_confirm_order_page.dart';
import 'package:book_store/futures/category/presintation/pages/my_category_page.dart';
import 'package:book_store/core/pages/my_bottom_nav_bar.dart';
import 'package:book_store/futures/cart/presintation/pages/my_map_page.dart';
import 'package:book_store/futures/natication/presintations/pages/my_promo_natification_page.dart';
import 'package:book_store/futures/profil/presotation/pages/widgets/my_log_out_model.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_up_page.dart';
import 'package:book_store/futures/status_order/my_bals_of_oeder_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_promo_code.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_baners.dart';
import 'package:book_store/futures/status_order/my_status_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_home_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_favorite_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_hrlp_center_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_my_account_page.dart';
import 'package:book_store/futures/profil/presotation/pages/my_profil_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_author_info_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_authors_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_vendors_page.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_authors_category.dart';
import 'package:book_store/futures/home/presintation/pages/widgets/my_venders_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthCubit(),
        child:MySingUpPage()
      ),
    );
  }
}
