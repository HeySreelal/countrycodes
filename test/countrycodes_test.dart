import 'package:countrycodes/countrycodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Country Codes Example', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CountryField(),
        ),
      ),
    );
  });
}
