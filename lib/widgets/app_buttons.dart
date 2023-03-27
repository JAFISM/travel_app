import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../myapp_colorss/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons({Key? key,
    this.isIcon=false,
    this.text="hi",
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor,width: 1),
          color: backgroundColor),
      child: isIcon==false?Center(child: AppText(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
