import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_bottom.dart';
import 'package:flutter/material.dart';

class MyStatusPage extends StatefulWidget {
  MyStatusPage({super.key});

  @override
  State<MyStatusPage> createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<MyStatusPage> {
  final int idCode = 2930541;

  List<_MM> products = [
    _MM(count: 1, name: "Carrie Fisher", price: 16.34),
    _MM(count: 2, name: "Carrie Fisher", price: 16.34),
    _MM(count: 3, name: "Carrie Fisher", price: 16.34),
    _MM(count: 1, name: "Carrie Fisher", price: 16.34),
    _MM(count: 2, name: "Carrie Fisher", price: 16.34),
    _MM(count: 3, name: "Carrie Fisher", price: 16.34),
    _MM(count: 1, name: "Carrie Fisher", price: 16.34),
    _MM(count: 2, name: "Carrie Fisher", price: 16.34),
    _MM(count: 3, name: "Carrie Fisher", price: 16.34),
  ];

  double price = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products.forEach((e) {
      price = price + e.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 135,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Thankyou 👋", style: AppTextStyle.bodyLage16R),
                  Text(
                    "Lorem ipsum dolor sit",
                    style: AppTextStyle.H3.copyWith(
                      color: AppColors.primary500,
                    ),
                  ),
                  Text("Order #$idCode"),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you want to cancel your order? ",
                  style: AppTextStyle.bodyMedium14R.copyWith(
                    color: AppColors.greyscale500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: AppTextStyle.bodyMedium14R.copyWith(
                      color: AppColors.primary500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text("Order Details", style: AppTextStyle.H5),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.greyscale100),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: products.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = products[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "x${item.count}   ",
                                    style: AppTextStyle.bodyMedium14R,
                                  ),
                                  Text(
                                    "${item.name}",
                                    style: AppTextStyle.bodyMedium14R,
                                  ),
                                ],
                              ),
                              Text(
                                "\$${item.price.toInt()}",
                                style: AppTextStyle.bodyMedium14R,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 8),
                  Divider(color: AppColors.greyscale100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: AppTextStyle.bodyMedium14M),
                      Text(
                        "${price.toInt()}",
                        style: AppTextStyle.bodyMedium14M,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: AppColors.greyscale100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shopping", style: AppTextStyle.bodyMedium14M),
                      Text("2", style: AppTextStyle.bodyMedium14M),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: AppColors.greyscale100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: AppTextStyle.bodyMedium14B.copyWith(color: AppColors.primary500)),
                      Text(
                        "\$${price.toInt() + 2}",
                        style: AppTextStyle.bodyMedium14B.copyWith(color: AppColors.primary500),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery in", style: AppTextStyle.bodyMedium14R),
                      Text("10-15 mins", style: AppTextStyle.bodyMedium14R),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time", style: AppTextStyle.bodyMedium14M),
                      Text("15.24 - 15.39", style: AppTextStyle.bodyMedium14M),
                    ],
                  ),
                ],
              ),
            ),
          SizedBox(height: 40,),
          MyBottom(color: AppColors.primary50, titile: "Order Status", onPressed: (){},textColor: AppColors.primary500,),
          SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

class _MM {
  final String name;
  final int count;
  final double price;
  _MM({required this.count, required this.name, required this.price});
}
