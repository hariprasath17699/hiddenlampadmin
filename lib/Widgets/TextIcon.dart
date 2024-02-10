
import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String icon;
  final String text;
  final double iconSize;
  final double textSize;
  final Color color;

  TextIcon({
    required this.icon,
    required this.text,
    required this.iconSize,
    required this.textSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(

          icon,
          height: iconSize,
        ),
        SizedBox(height: 4.0),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}