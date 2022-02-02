import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:flutter/material.dart';

class CustomLargeText extends StatelessWidget {
  CustomLargeText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.fontSize = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final Color color;
  final String text;
  final TextOverflow overflow;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: fontSize == 0 ? Dimensions.font20 : fontSize,
      ),
    );
  }
}
