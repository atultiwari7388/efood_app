import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  CustomSmallText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.fontSize = 0,
    this.overflow = TextOverflow.ellipsis,
    this.height = 1.2,
  }) : super(key: key);
  final Color color;
  final String text;
  final TextOverflow overflow;
  final double fontSize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: fontSize == 0 ? Dimensions.font12 : fontSize,
      ),
    );
  }
}
