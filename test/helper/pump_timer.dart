import 'package:flutter_test/flutter_test.dart';

Future<void> pumpTimer(WidgetTester tester) async {
  for (var i = 0; i < 3; i++) {
    await tester.pump(const Duration(seconds: 1));
  }
}
