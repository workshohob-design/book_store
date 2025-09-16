// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_code_page.dart';
import 'package:book_store/core/pages/my_congratulation_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_forget_password_page.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
// import 'package:book_store/futures/auth/presintaion/cubit/sing_in_cubit/sing_in_cubit.dart';
// import 'package:book_store/futures/auth/presintaion/cubit/sing_in_cubit/sing_in_state.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:book_store/futures/auth/presintaion/pages/widgets/is_corect_pw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySingUpPage extends StatefulWidget {
  const MySingUpPage({super.key});

  @override
  State<MySingUpPage> createState() => _MySingUpPageState();
}

class _MySingUpPageState extends State<MySingUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  final _key = GlobalKey<FormState>();
  bool isRedy = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).canPop();
            },
            icon: Image.asset(AppIcons.arrow_left_outline),
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // print('listener is working');
            // print('');
            // print(state);
            // print('');
            if (state is AuthError) {
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
            if (state is AuthMessege) {
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
                    child: MyCodePage(
                      mail: emailController.text,
                      msg: state.messege,
                      content: 'Please enter the code we just sent to email ',
                      type: 'up',
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sing Up ", style: AppTextStyle.H3),
                    Text(
                      "Create account and choose favorite menu",
                      style: TextStyle(
                        color: AppColors.greyscale500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24),
                    MyTextFild(
                      title: "Name",
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "text is empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
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
                      onChanged: (value) {
                        if (isRedy == true) {
                          setState(() {});
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          isRedy = true;
                          return " ";
                        } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                          isRedy = true;
                          return " ";
                        } else if (!RegExp(
                          r'^(?=.*[0-9]).{8,}$',
                        ).hasMatch(value)) {
                          isRedy = true;
                          return " ";
                        } else if (!RegExp(
                          r'^(?=.*[A-Za-z]).+$',
                        ).hasMatch(value)) {
                          isRedy = true;
                          return " ";
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
                    MyIsCorectPw(
                      isTrue: isRedy,
                      controller: passwordController,
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 24),
                    MyBottom(
                      color: AppColors.primary500,
                      titile: state is AuthLoading ? "Loading..." : "Register",
                      onPressed: state is AuthLoading
                          ? null
                          : () async {
                              if (_key.currentState!.validate()) {
                                context.read<AuthCubit>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                  // email: 'shohob1@gmail.com',
                                  // password: 'Teqweqweest1234',
                                  // name: 'shwqeweradsadohob',
                                );
                              }
                            },
                    ),

                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Have an account?",
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
                                      child: MySingInPage(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                " Sing In",
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "By clicking Register, you agree to our ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.greyscale500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Terms, Data Policy.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primary500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
