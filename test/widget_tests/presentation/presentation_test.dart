import 'package:flutter_show/main.dart';
import 'package:flutter_show/presentation/view/presentation_slides.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Test render presentation', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyFluttershow()));
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PresentationSlides), findsOneWidget);
  });
}
