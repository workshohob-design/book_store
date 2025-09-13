import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_enter_email_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my-enter_phone_page.dart';
import 'package:book_store/futures/forget_password/presintation/pages/widgets/my_choose.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyForgetPasswordPage extends StatefulWidget {
  const MyForgetPasswordPage({super.key});

  @override
  State<MyForgetPasswordPage> createState() => _MyForgetPasswordPageState();
}

class _MyForgetPasswordPageState extends State<MyForgetPasswordPage> {
  bool which = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(AppIcons.arrow_left_outline),
          ),
        ),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forgot Password", style: AppTextStyle.H3),
                  SizedBox(height: 8),
                  Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                      color: AppColors.greyscale500,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              MyChoose(
                which: which,
                onTap: () {
                  which = true;
                  setState(() {});
                },
                onTap2: () {
                  which = false;
                  setState(() {});
                },
              ),
              SizedBox(height: 50),
              MyBottom(
                color: AppColors.primary500,
                titile: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => AuthCubit(),
                        child: which == false
                            ? MyCodeEmailPage()
                            : MyEnterPhonePage(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
