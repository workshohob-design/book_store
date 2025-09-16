import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_code_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNewPWPage extends StatelessWidget {
  MyNewPWPage({super.key, required this.reset_token});
  final String reset_token;
  final TextEditingController PWcontroller = TextEditingController();
  final TextEditingController ConfirmPWcontroller = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Image.asset(AppIcons.arrow_left_outline),
          ),
        ),
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Password", style: AppTextStyle.H3),
                    SizedBox(height: 8),
                    Text(
                      "Create your new password, so you can login to your account.",
                      style: TextStyle(
                        color: AppColors.greyscale500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                MyTextFild(
                  title: "New Password",
                  controller: PWcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^(?=.*[0-9]).{8,}$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^(?=.*[A-Za-z]).+$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),
                MyTextFild(
                  title: "Confirm Password",
                  controller: ConfirmPWcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^(?=.*[0-9]).{8,}$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (!RegExp(r'^(?=.*[A-Za-z]).+$').hasMatch(value)) {
                      return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                    } else if (ConfirmPWcontroller.text != PWcontroller.text) {
                      return "Confirm PassWord is not corect";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 25),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (BuildContext context, AuthState state) {
                    if (state is AuthMessege) {
                      print("success in page");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.messege,
                            style: AppTextStyle.bodyMedium14M.copyWith(
                              color: AppColors.green500,
                            ),
                          ),
                          backgroundColor: AppColors.green100,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthCubit(),
                            child: MySingInPage(),
                          ),
                        ),
                      );
                    }
                    if (state is AuthError) {
                      print("error in page");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 10,
                          content: Text(
                            state.error,
                            style: AppTextStyle.bodyMedium14M.copyWith(
                              color: AppColors.red500,
                            ),
                          ),
                          backgroundColor: AppColors.red100,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return MyBottom(
                      color: AppColors.primary500,
                      titile: state is AuthLoading ? "Loading..." : "Send",
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              // if (_key.currentState!.validate()) {
                              context.read<AuthCubit>().newPassWord(
                                reset_token: reset_token,
                                newPW: "Test1234",
                              );
                            // },
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
