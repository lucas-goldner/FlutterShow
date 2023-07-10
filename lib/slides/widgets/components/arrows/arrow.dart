import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/slides/widgets/text/regular_text.dart';

class Arrow extends StatelessWidget {
  const Arrow(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.height = 24.0,
    this.width = 24.0,
  });
  final String text;
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Icon(
            CupertinoIcons.arrow_right,
            color: color,
            size: height,
          ),
        ),
        const SizedBox(width: 8),
        RegularText(
          text,
          fontSize: 24,
        ),
      ],
    );
  }
}
