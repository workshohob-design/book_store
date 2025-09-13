// import 'package:book_store/core/assets/app_icons.dart';
import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyKeybord extends StatelessWidget {
  MyKeybord({
    super.key,
    required this.isWhite,
    required this.onBackspace,
    required this.onTap,
  });
  final bool isWhite;
  final void Function(String item) onTap;
  final void Function() onBackspace;
  final List numders = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ".",
    "0",
    Icon(Icons.backspace_outlined, size: 28),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      color: isWhite ? AppColors.greyscale50 : AppColors.primary500,
      width: double.infinity,
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 80,
        ),
        itemBuilder: (context, index) {
          final item = numders[index];
          return InkWell(
            onTap: () =>
                index != numders.length - 1 ? onTap(item) : onBackspace(),
            child: Container(
              child: Center(
                child: index == numders.length - 1
                    ? Icon(
                        Icons.backspace_outlined,
                        color: !isWhite ? Colors.white : Colors.black,
                        size: 28,
                      )
                    : Text(
                        item,
                        style: isWhite
                            ? AppTextStyle.H3
                            : AppTextStyle.H3.copyWith(color: AppColors.white),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
