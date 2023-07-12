import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_show/presentation/config/pages_of_presentation.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttershow_base/components/widgets/fluttershow_base_components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlideShow extends ConsumerWidget {
  const SlideShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color generateRandomColor() {
      final random = Random();
      final r = random.nextInt(256);
      final g = random.nextInt(256);
      final b = random.nextInt(256);
      return Color.fromARGB(255, r, g, b);
    }

    void switchToSlide(int index) =>
        ref.read(presentationController.notifier).switchToPage(index);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: PagesOfPresentation.values
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () => switchToSlide(entry.key),
                child: Container(
                  color: generateRandomColor(),
                  height: 100,
                  width: 100,
                  margin: allPadding12,
                  child: Center(
                    child: Padding(
                      padding: allPadding4,
                      child: Text(
                        entry.value.title ?? 'Slide-${entry.key}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
