import 'package:currency_converter/classes/convertion_controller.dart';
import 'package:currency_converter/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('Home Page', () {
    testWidgets('home page currency conversion works correctly', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final currencyInput = find.byType(TextFormField);
      final convertButton = find.text('Convert');
      final inputText = '10';

      expect(find.text('0.00 Rs'), findsOneWidget);

      await tester.enterText(currencyInput, inputText);
      await tester.pumpAndSettle();

      await tester.tap(convertButton);
      await tester.pumpAndSettle();

      final convertionController = ConvertionController();
      final expectedResult =
          "${convertionController.calculateExchangeRate(inputText).toStringAsFixed(2)} Rs";

      expect(find.text(expectedResult), findsOneWidget);
    });

    testWidgets(
      'shows error message for empty input after users clears his input',
      (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        final currencyInput = find.byType(TextFormField);

        await tester.enterText(currencyInput, "10");
        await tester.pumpAndSettle();

        await tester.enterText(currencyInput, "");
        await tester.pumpAndSettle();

        expect(find.text('Amount is required'), findsOneWidget);
      },
    );

    testWidgets('shows error message for empty input', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final convertButton = find.text('Convert');

      await tester.tap(convertButton);
      await tester.pumpAndSettle();

      expect(find.text('Amount is required'), findsOneWidget);
    });
  });
}
