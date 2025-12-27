import 'dart:convert';

import 'package:pak_rupee_converter/contants/contants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  Map<String, dynamic> _rates = {};
  bool _isLoading = false;
  String? _error;
  String _currency = 'usd';

  Map<String, dynamic> get rates => _rates;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get currency => _currency;

  void setCurrency(String value) {
    _currency = value;
    notifyListeners();
  }

  Future<void> fetchRates() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    const errorMessage = 'Could not fetch conversion rates, try again later';

    try {
      const String uri =
          'https://latest.currency-api.pages.dev/v1/currencies/pkr.json';
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode != 200) {
        _error = errorMessage;
      } else {
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        _rates = _getFilterRates(responseBody['pkr']);
      }
    } catch (e) {
      _error = errorMessage;
    }

    _isLoading = false;
    notifyListeners();
  }

  double calculateExchangeRate(String amountText) {
    if (amountText.isEmpty) return 0;

    final amount = double.tryParse(amountText);

    if (amount == null) return 0;

    final exchangeRate = _rates[_currency] ?? 1;

    return amount / exchangeRate;
  }

  Map<String, dynamic> _getFilterRates(Map<String, dynamic> rates) {
    return Map.fromEntries(
      rates.entries.where(
        (element) => availableCurrency.contains(element.key.toLowerCase()),
      ),
    );
  }
}
