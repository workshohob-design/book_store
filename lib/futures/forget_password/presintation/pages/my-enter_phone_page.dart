import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/pages/my_code_page.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:flutter/material.dart';

class MyEnterPhonePage extends StatelessWidget {
  MyEnterPhonePage({super.key});
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
                  title: "Phone",
                  keyboardType: TextInputType.phone,
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number cannot be empty';
                    }

                    final regex = RegExp(r'^\+?[0-9]{7,15}$');
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                MyBottom(
                  color: AppColors.primary500,
                  titile: "Send",
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MyCodePage(
                      //       title: 'Verification Code',
                      //       content:
                      //           'Please enter the code we just sent to phone number',
                      //       type: controller.text.toString(), checkCode: "0000",
                      //     ),
                      //   ),
                      // );
                    }
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
