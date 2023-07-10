import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/slides/views/slide_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PushupCounter extends HookConsumerWidget {
  const PushupCounter(this.pushups, {super.key});
  final int pushups;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlideTitle(
      titleText: S.of(context).pushups(pushups),
    );
  }
}
