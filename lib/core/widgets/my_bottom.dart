import 'package:book_store/core/theme/app_colors.dart';
import 'package:book_store/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MyBottom extends StatelessWidget {
  const MyBottom({
    super.key,
    required this.color,
    required this.titile,
    this.border = 48,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.textColor = AppColors.white,
    this.borderSide = Colors.transparent,
    this.textStyle = null
    // TextStyle(
    //         fontSize: 16,
    //         fontWeight: FontWeight.w700,
    //         color: textColor,
    //       )
  });
  final Color color;
  final String titile;
  final double border;
  final double height;
  final double width;
  final void Function()? onPressed;
  final Color textColor;
  final Color borderSide;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderSide),
            borderRadius: BorderRadius.circular(border),
          ),
        ),
        child: Text(
          titile,
          style:textStyle==null? AppTextStyle.H6.copyWith(color: textColor):textStyle
        ),
      ),
    );
  }
}
