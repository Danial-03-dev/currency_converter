class ConvertionController {
  final double exchangeRate;
  ConvertionController({this.exchangeRate = 283.17});

  double calculateExchangeRate(String amountText) {
    if (amountText.isEmpty) return 0;

    final amount = double.tryParse(amountText);

    if (amount == null) return 0;

    return amount * exchangeRate;
  }
}
