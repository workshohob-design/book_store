import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/assets/app_images.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:book_store/core/widgets/my_text_fild.dart';
import 'package:flutter/material.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  final List<_MM> books = [
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame12),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame13),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame14),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame15),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame16),
  ];

  List<_MM> filteredBooks = [];
  List<_MM> resentSearch = [
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
    _MM(name: "The Kite Runner", price: "14.32", image: AppImages.Frame),
  ];
  final TextEditingController controller = TextEditingController();
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
        title: Text("Search", style: AppTextStyle.H4),
      ),
      //filteredBooks.isNotEmpty? ListView.builder(itemBuilder: (context, index) {}):Column()
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MyTextFild(
              onChanged: (value) {
                filteredBooks.clear();
                books.forEach((e) {
                  if (e.name.trim().toLowerCase().contains(
                    controller.text.toLowerCase(),
                  )) {
                    filteredBooks.add(e);
                  }
                });
                setState(() {});
              },
              borderColor: AppColors.greyscale500,
              title: "Search",
              controller: controller,
              prefix: Image.asset(
                AppIcons.search,
                colorBlendMode: BlendMode.srcIn,
                color: AppColors.greyscale500,
              ),
              isTitle: false,
            ),
          ),
          Expanded(
            child: filteredBooks.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 12,
                        mainAxisExtent: 225,
                        crossAxisCount: 2,
                      ),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final item = books[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: ClipRRect(
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(item.name, style: AppTextStyle.bodyLage16M),
                              SizedBox(height: 4),
                              Text(
                                item.price,
                                style: AppTextStyle.bodyMedium14B.copyWith(
                                  color: AppColors.primary500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recent Searches", style: AppTextStyle.H6),
                        SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: resentSearch.length <= 4
                              ? resentSearch.length
                              : 4,
                          itemBuilder: (context, index) {
                            final item = resentSearch[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  item.name,
                                  style: AppTextStyle.bodyLage16R.copyWith(
                                    color: AppColors.greyscale500,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Divider(color: AppColors.greyscale100),
                              ],
                            );
                          },
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
