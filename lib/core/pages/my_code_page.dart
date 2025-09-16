import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_congratulation_page.dart';
// import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_keybord.dart';
import 'package:book_store/futures/forget_password/presintation/pages/my_new_pw_page.dart';
import 'package:book_store/futures/home/presintation/pages/my_home_page.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
import 'package:book_store/futures/sing_up_in/presintation/pages/my_sing_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCodePage extends StatefulWidget {
  MyCodePage({
    super.key,
    this.phone,
    this.mail,
    required this.msg,
    required this.content,
    required this.type,
  });
  final String? phone;
  final String? mail;
  final String type;
  final String msg;
  final String content;

  @override
  State<MyCodePage> createState() => _MyCodePageState();
}

class _MyCodePageState extends State<MyCodePage> {
  List<String> code = ["", "", "", ""];
  int index = 0;
  bool isTrue = true;
  SizedBox isCorrect() {
    return !isTrue
        ? SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NOT Correct",
                  style: AppTextStyle.bodyLage16M.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  void enter(String item) {
    if (index >= 0 && index <= 3 && code[3] == "") {
      code[index] = item;
      index = index != 3 ? index + 1 : index;
      setState(() {});
    }
  }

  void remove() {
    if (index >= 0 && index <= 3) {
      // code.remove(code[code.length - 1]);
      code[index] = "";
      index = index != 0 ? index - 1 : index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(widget.mail ?? widget.phone!, style: AppTextStyle.H3),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: widget.mail ?? widget.phone,
                          style: AppTextStyle.bodyLage16R.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                      text: widget.content,
                      style: AppTextStyle.bodyLage16R.copyWith(
                        color: AppColors.greyscale500,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppColors.greyscale50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(code[0], style: AppTextStyle.H3),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppColors.greyscale50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(code[1], style: AppTextStyle.H3),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppColors.greyscale50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(code[2], style: AppTextStyle.H3),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: AppColors.greyscale50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(code[3], style: AppTextStyle.H3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  isCorrect(),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If you didn’t receive a code?",
                        style: AppTextStyle.bodyMedium14M.copyWith(
                          color: AppColors.greyscale500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Resend",
                          style: AppTextStyle.bodyMedium14M.copyWith(
                            color: AppColors.primary500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (BuildContext context, AuthState state) {
                        // print("error");
                        // print("${"#" * 50}");
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
                          // print("ok");
                          // print("${"#" * 50}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.messege!,
                                style: AppTextStyle.bodyMedium14M.copyWith(
                                  color: AppColors.green500,
                                ),
                              ),
                              backgroundColor: AppColors.green100,
                            ),
                          );
                          if (widget.type == "up") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: MySingInPage(),
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: MyNewPWPage(reset_token: state.messege,),
                                ),
                              ),
                            );
                          }

                          // Navigator();
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyBottom(
                              color: AppColors.primary500,
                              titile: state is AuthLoading
                                  ? "Loading..."
                                  : "Continue",
                              onPressed: state is AuthLoading
                                  ? null
                                  : () async {
                                      String i = "";
                                      code.forEach((e) {
                                        i = "$i$e";
                                      });
                                      // try {
                                      if (widget.type == "up") {
                                        context.read<AuthCubit>().verify(
                                          email: widget.mail!,
                                          otp: i,
                                        );
                                      } else {
                                        context
                                            .read<AuthCubit>()
                                            .forgetPWVerify(
                                              email: widget.mail!,
                                              otp: i,
                                            );
                                      }
                                      // } catch (e) {}
                                    },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 360,
            child: MyKeybord(isWhite: true, onBackspace: remove, onTap: enter),
          ),
        ],
      ),
    );
  }
}
