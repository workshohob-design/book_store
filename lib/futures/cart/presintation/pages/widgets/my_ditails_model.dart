import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyDitailsModel extends StatefulWidget {
  MyDitailsModel({super.key, required this.dateNow});
  final String dateNow;

  @override
  State<MyDitailsModel> createState() => _MyDitailsModelState();
}

class _MyDitailsModelState extends State<MyDitailsModel> {
  // List<int> dateList = [0,1,];
  int dateOFDelivery = 0;

  int timeOFDelivery = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(children: [Text("Delivery date", style: AppTextStyle.H5)]),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    dateOFDelivery = 0;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.sizeOf(context).width / 3 - 40,
                    width: MediaQuery.sizeOf(context).width / 3 - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: dateOFDelivery != 0
                            ? AppColors.greyscale200
                            : AppColors.primary500,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Today", style: AppTextStyle.H6),
                        Text("${widget.dateNow}", style: AppTextStyle.H6),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    dateOFDelivery = 1;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.sizeOf(context).width / 3 - 40,
                    width: MediaQuery.sizeOf(context).width / 3 - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: dateOFDelivery != 1
                            ? AppColors.greyscale200
                            : AppColors.primary500,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Tomorrow", style: AppTextStyle.H6),
                        Text("${widget.dateNow}", style: AppTextStyle.H6),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    dateOFDelivery = 2;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.sizeOf(context).width / 3 - 40,
                    width: MediaQuery.sizeOf(context).width / 3 - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: dateOFDelivery != 2
                            ? AppColors.greyscale200
                            : AppColors.primary500,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Pick", style: AppTextStyle.H6),
                        Text("a data", style: AppTextStyle.H6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(children: [Text("Delivery time", style: AppTextStyle.H5)]),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    timeOFDelivery = 0;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.sizeOf(context).width / 3 - 40,
                    width: MediaQuery.sizeOf(context).width / 2 - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: timeOFDelivery != 0
                            ? AppColors.greyscale200
                            : AppColors.primary500,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Between", style: AppTextStyle.H6),
                        Text("10PM : 11PM", style: AppTextStyle.H6),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    timeOFDelivery = 1;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: MediaQuery.sizeOf(context).width / 3 - 40,
                    width: MediaQuery.sizeOf(context).width / 2 - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: timeOFDelivery != 1
                            ? AppColors.greyscale200
                            : AppColors.primary500,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Between", style: AppTextStyle.H6),
                        Text("10AM : 11AM", style: AppTextStyle.H6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
