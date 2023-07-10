import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercon_2023_presentation/main.dart';
import 'package:fluttercon_2023_presentation/presentation/view/presentation_slides.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Test render presentation', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyPresentation()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
  });
}
