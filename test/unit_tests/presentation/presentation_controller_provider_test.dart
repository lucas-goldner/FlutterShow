import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('Test presentation controller provider', () {
    test('test initial state page is 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );
    });

    test('test go to last page when 0', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );

      container
          .read<PresentationController>(presentationController.notifier)
          .toLastPage();

      expect(
        container
            .read<PresentationController>(presentationController.notifier)
            .state
            .page,
        0,
      );
    });
  });
}
