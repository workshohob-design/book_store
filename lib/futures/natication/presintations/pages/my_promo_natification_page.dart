import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyPromoNatificationPage extends StatelessWidget {
  MyPromoNatificationPage({super.key});
  List<_MM> products = [
    _MM(
      name: "The Da vinci Code",
      path: AppImages.Frame,
      proosses: "Delivered",
      count: 1,
    ),
    _MM(
      name: "The Da vinci Code",
      path: AppImages.Frame,
      proosses: "Delivered",
      count: 1,
    ),
    _MM(
      name: "The Da vinci Code",
      path: AppImages.Frame,
      proosses: "On the way",
      count: 1,
    ),
    _MM(
      name: "The Da vinci Code",
      path: AppImages.Frame,
      proosses: "Cancelled",
      count: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Natification", style: AppTextStyle.H4),
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(AppIcons.arrow_left_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.greyscale200),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    item.path,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: AppTextStyle.bodyLage16S,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.proosses,
                                        style: AppTextStyle.bodyMedium14M
                                            .copyWith(
                                              color:
                                                  item.proosses[0]
                                                          .toLowerCase() ==
                                                      "d"
                                                  ? Colors.green
                                                  : item.proosses[0]
                                                            .toLowerCase() ==
                                                        "o"
                                                  ? AppColors.blue
                                                  : AppColors.red,
                                            ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "${item.count}  items",
                                        style: AppTextStyle.bodyMedium14M
                                            .copyWith(
                                              color: AppColors.greyscale500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        index != products.length - 1
                            ? Divider(color: AppColors.greyscale200)
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MM {
  final String name;
  final String path;
  final String proosses;
  final int count;

  _MM({
    required this.name,
    required this.path,
    required this.proosses,
    required this.count,
  });
}
