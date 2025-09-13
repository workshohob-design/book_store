import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_code_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_cubit.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCodeEmailPage extends StatelessWidget {
  MyCodeEmailPage({super.key});
  final TextEditingController controller = TextEditingController();
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
                MyTextFild(
                  title: "Email",
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    final regex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (BuildContext context, AuthState state) {
                    if (state is AuthMessege) {
                      // print("ok");
                      // print("${"#" * 50}");
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
                              mail: controller.text,
                              msg: state.messege.toString(),
                              content:
                                  'Please enter the code we just sent to email ',
                              type: 'for',
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is AuthError) {
                      // print("error");
                      // print("${"#" * 50}");
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
                              if (_key.currentState!.validate()) {
                                context.read<AuthCubit>().forgetPassWord(
                                  email: controller.text,
                                );
                              }
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
