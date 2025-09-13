import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyPriceDitails extends StatefulWidget {
  MyPriceDitails({super.key});

  @override
  State<MyPriceDitails> createState() => _MyPriceDitailsState();
}

class _MyPriceDitailsState extends State<MyPriceDitails> {
  double price = 0;

  final List<_MM> books = [
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame12),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame13),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame14),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame15),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame16),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = 0;
    books.forEach((e) {
      price = price + double.parse(e.price).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: BoxBorder.all(color: AppColors.greyscale200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [Text("Summary", style: AppTextStyle.H5)]),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price", style: AppTextStyle.bodyMedium14R),
                    Text("\$${price + 2}", style: AppTextStyle.bodyMedium14R),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shopping", style: AppTextStyle.bodyMedium14R),
                    Text("2.0", style: AppTextStyle.bodyMedium14R),
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: AppColors.greyscale200),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Payment", style: AppTextStyle.bodyMedium14S),
                    Text("\$${price + 2}", style: AppTextStyle.bodyMedium14S),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                showDragHandle: true,
                backgroundColor: AppColors.white,
                scrollControlDisabledMaxHeightRatio:
                    MediaQuery.sizeOf(context).height / 2,
                builder: (context) => Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Text("Payment Details", style: AppTextStyle.H5),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.greyscale200),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                  Text(
                                    "\$$price",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: books.length,
                                itemBuilder: (context, index) {
                                  final item = books[index];
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.name,
                                            style: AppTextStyle.bodySmall12R
                                                .copyWith(
                                                  color: AppColors.greyscale500,
                                                ),
                                          ),
                                          Text(
                                            "\$${item.price}",
                                            style: AppTextStyle.bodySmall12R
                                                .copyWith(
                                                  color: AppColors.greyscale500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(height: 8),
                              Divider(color: AppColors.greyscale200),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shopping",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                  Text(
                                    "\$$price",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Divider(color: AppColors.greyscale200),
                            
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Payment",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                  Text(
                                    "\$${price+2}",
                                    style: AppTextStyle.bodyMedium14S,
                                  ),
                                ],
                              ),
                            
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: SizedBox(
              height: 50,
              child: Column(
                children: [
                  Divider(color: AppColors.greyscale200),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                "See details",
                                style: AppTextStyle.bodyMedium14B.copyWith(
                                  color: AppColors.primary500,
                                ),
                              ),
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: Image.asset(
                                  AppIcons.chevron_right,
                                  colorBlendMode: BlendMode.srcIn,
                                  color: AppColors.primary500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

class _MM {
  final String name;
  final String price;
  final String image;
  _MM({required this.name, required this.price, required this.image});
}
