import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLines = 10;
  TextWidget(
      {required this.text,
      required this.color,
      this.isTitle = false,
      this.maxLines = 10,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: textSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
