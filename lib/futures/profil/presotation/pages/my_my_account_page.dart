import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:flutter/material.dart';

class MyMyAccountPage extends StatefulWidget {
  MyMyAccountPage({super.key});

  @override
  State<MyMyAccountPage> createState() => _MyMyAccountPageState();
}

class _MyMyAccountPageState extends State<MyMyAccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObs = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = "Shohob";
    phoneController.text = "881368002";
    emailController.text = "shehmed3@gmail.com";
    passwordController.text = "881368002";
  }

  isChangeObs() {
    isObs = !isObs;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("My Accaunt", style: AppTextStyle.H4),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 164,
            child: Stack(
              children: [
                Container(
                  height: 74,
                  width: double.maxFinite,
                  color: AppColors.primary50,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.primary200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change Picture",
                        style: AppTextStyle.bodyLage16S.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              children: [
                MyTextFild(title: "Name", controller: nameController),
                SizedBox(height: 16),
                MyTextFild(
                  title: "Phone",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                MyTextFild(
                  title: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                MyTextFild(
                  title: "PassWord",
                  controller: passwordController,
                  obscureText: isObs,
                  suffix: IconButton(
                    onPressed: () {
                      isChangeObs();
                    },
                    icon: Image.asset(
                      AppIcons.password_outline,
                      colorBlendMode: BlendMode.srcIn,
                      color: AppColors.greyscale500,
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyBottom(
                    color: AppColors.primary500,
                    titile: "Save Changes",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    height: 58,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
