import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/small_text.widget.dart';
import 'package:flutter/material.dart';

class CustomIconAndTextWidget extends StatelessWidget {
  const CustomIconAndTextWidget({
    Key? key,
    required this.iconColor,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        SizedBox(width: Dimensions.width5),
        CustomSmallText(text: text),
      ],
    );
  }
}
