import 'package:flutter/cupertino.dart';
import 'package:flutter_show/presentation/config/presentation_slides.dart';
import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';
import 'package:fluttershow_base/fluttershow_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlideShow extends ConsumerWidget {
  const SlideShow({this.slides, super.key});

  /// Used for widget tests, safe to ignore.
  @visibleForTesting
  final List<PresentationSlide>? slides;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentationSlidesIndexed =
        slides?.asMap().entries.map((slide) => (slide.key, slide.value)) ??
            PagesOfPresentation.values.slides.indexed;

    void switchToSlide(int index) =>
        ref.read(presentationController.notifier).switchToPage(index);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: presentationSlidesIndexed
            .map(
              (entry) => GestureDetector(
                onTap: () => switchToSlide(entry.$1),
                child: Container(
                  color: CupertinoColors.activeBlue,
                  height: 100,
                  width: 100,
                  margin: allPadding12,
                  child: Center(
                    child: Padding(
                      padding: allPadding4,
                      child: Text(
                        entry.$2.title ?? 'Slide-${entry.$1}',
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
