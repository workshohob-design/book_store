import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:flutter/material.dart';

class MyAddLocPage extends StatelessWidget {
  MyAddLocPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController avenueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
        title: Text("Location", style: AppTextStyle.H4),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppIcons.gps)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "Name", controller: nameController),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(
                  title: "Governorate",
                  controller: governorateController,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "City", controller: cityController),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "Block", controller: blockController),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(
                  title: "Street Name",
                  controller: streetNameController,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(
                  title: "Building Name",
                  controller: buildingNameController,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "Floor", controller: floorController),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "Flat", controller: flatController),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                MyTextFild(title: "Avenue", controller: avenueController),
              ],
            ),
            SizedBox(height: 30),
            MyBottom(
              color: AppColors.primary500,
              titile: "Confirmation",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
