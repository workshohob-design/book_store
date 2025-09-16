import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_congratulation_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_forget_password_page.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_up_page.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/widgets/my_bottoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySingInPage extends StatefulWidget {
  MySingInPage({super.key});
  @override
  State<MySingInPage> createState() => _MySingInPageState();
}

class _MySingInPageState extends State<MySingInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.of(context).canPop();
          //   },
          //   icon: Image.asset(AppIcons.arrow_left_outline),
          // ),
        ),
        body: Form(
          key: _key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back 👋", style: AppTextStyle.H3),
                    Text(
                      "Sign to your account",
                      style: TextStyle(
                        color: AppColors.greyscale500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24),
                    MyTextFild(
                      title: "Email",
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "text is empty";
                        } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    MyTextFild(
                      obscureText: obscureText,
                      title: "Password",
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                        } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                          return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                        } else if (!RegExp(
                          r'^(?=.*[0-9]).{8,}$',
                        ).hasMatch(value)) {
                          return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                        } else if (!RegExp(
                          r'^(?=.*[A-Za-z]).+$',
                        ).hasMatch(value)) {
                          return "Password must be at least 8 characters,must contain at least 1 number,contain at least 1 letter ";
                        }

                        return null;
                      },
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Image.asset(
                          AppIcons.password_outline,
                          colorBlendMode: BlendMode.srcIn,
                          color: AppColors.greyscale400,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyForgetPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (BuildContext context, AuthState state) {
                        if (state is AuthMessege) {
                          // print("ok");
                          // print("${"#" * 50}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyCongratulationPage(
                                title: "Congratulation!",
                                content:
                                    "your account is complete, please enjoy the best menu from us.",
                                bottomText: "Get Started",
                              ),
                            ),
                          );
                        }
                        if (state is AuthError ){
                          // print("error");
                          // print("${"#" * 50}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 10,
                              content: Text(
                                state.error!,
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
                          titile: state is AuthLoading
                              ?"Loading..."
                              : "Log In" ,
                          onPressed: state is AuthLoading
                              ? null
                              : () {
                                  if (_key.currentState!.validate()) {
                                    context.read<AuthCubit>().logIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.greyscale500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthCubit(),
                                      child: MySingUpPage(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                " Sing Up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primary500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(height: 1, color: AppColors.greyscale200),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        "Or with",
                        style: TextStyle(
                          color: AppColors.greyscale400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(height: 1, color: AppColors.greyscale200),
                  ),
                ],
              ),
              MyBottoms(),
            ],
          ),
        ),
      ),
    );
  }
}
