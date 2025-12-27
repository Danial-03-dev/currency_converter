import 'package:pak_rupee_converter/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final error = context.select<CurrencyProvider, String?>(
      (provider) => provider.error,
    );

    return error == null
        ? const SizedBox()
        : Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
          );
  }
}
