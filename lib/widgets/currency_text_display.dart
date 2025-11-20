import 'package:flutter/material.dart';

class CurrencyTextDisplay extends StatelessWidget {
  final double result;

  const CurrencyTextDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${result.toStringAsFixed(2)} Rs',
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    );
  }
}
