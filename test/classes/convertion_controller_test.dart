import 'package:currency_converter/classes/convertion_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConvertionController convertionController;

  setUp(() {
    convertionController = ConvertionController();
  });
  group('Convertion Controller Class - ', () {
    test('returns 0 if the string is empty', () {
      const amountString = '';
      final result = convertionController.calculateExchangeRate(amountString);
      expect(result, 0);
    });

    test('returns 0 for non-numeric string', () {
      const amountString = 'sadasf';
      final result = convertionController.calculateExchangeRate(amountString);
      expect(result, 0);
    });

    test('returns correct calculation for integar value', () {
      const amountString = '10';
      const expectedValue = 283.17 * 10; // 283.17 * 10 = 2831.7

      final result = convertionController.calculateExchangeRate(amountString);

      expect(result, expectedValue);
    });

    test('returns correct calculation for decimal value', () {
      const amountString = '2.5';
      const expectedValue = 283.17 * 2.5; // 283.17 * 2.5 = 707.925

      final result = convertionController.calculateExchangeRate(amountString);

      expect(result, expectedValue);
    });

    test('returns correct calculation for custom exchange rate', () {
      const amountString = '10';
      const double exchangeRate = 10;
      const expectedValue = 100; // 10 * 10 = 100

      convertionController = ConvertionController(exchangeRate: exchangeRate);

      final result = convertionController.calculateExchangeRate(amountString);

      expect(result, expectedValue);
    });
  });
}
