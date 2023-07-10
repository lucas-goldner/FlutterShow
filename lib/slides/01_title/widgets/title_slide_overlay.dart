import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_show/components/widgets/layout/layout_header.dart';
import 'package:flutter_show/generated/assets.gen.dart';

class TitleSlideOverlay extends StatelessWidget {
  const TitleSlideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutHeader(
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child:
                    Assets.images.shared.flutterIcon.svg(width: 80, height: 80),
              ),
            ],
          ),
          flexUnits: 1,
        ),
      ],
    );
  }
}
