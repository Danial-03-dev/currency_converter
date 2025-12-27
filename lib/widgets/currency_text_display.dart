import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyTextDisplay extends StatelessWidget {
  final double result;

  const CurrencyTextDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final formatedResult = NumberFormat('#,##,##0.00', 'en_IN').format(result);

    return Text(
      '$formatedResult Rs',
      style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
    );
  }
}
