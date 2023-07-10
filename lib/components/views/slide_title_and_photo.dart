import 'package:flutter/material.dart';
import 'package:flutter_show/components/views/slide_title.dart';

class SlideTitleAndPhoto extends StatelessWidget {
  const SlideTitleAndPhoto(this.image, {super.key});
  final Image image;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          image,
          const SlideTitle(
            titleText: 'Dummy',
            subTitleText: 'Little subtitle',
            footerText: 'Dummy Footer',
            titleColors: [Colors.black, Colors.black],
            textColor: Colors.black,
          )
        ],
      );
}
