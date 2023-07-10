import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_show/generated/assets.gen.dart';
import 'package:fluttershow_base/components/widgets/fluttershow_base_components.dart';

class TitleSlideOverlay extends StatelessWidget {
  const TitleSlideOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutHeader(
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child:
                    Assets.images.shared.flutterIcon.svg(width: 80, height: 80),
              ),
              const Spacer(),
            ],
          ),
          flexUnits: 1,
        ),
      ],
    );
  }
}
