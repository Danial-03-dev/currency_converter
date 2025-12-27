import 'package:pak_rupee_converter/providers/currency_provider.dart';
import 'package:pak_rupee_converter/widgets/convert_button.dart';
import 'package:pak_rupee_converter/widgets/currency_input.dart';
import 'package:pak_rupee_converter/widgets/currency_selector.dart';
import 'package:pak_rupee_converter/widgets/currency_text_display.dart';
import 'package:pak_rupee_converter/widgets/error_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyForm extends StatefulWidget {
  const CurrencyForm({super.key});

  @override
  State<CurrencyForm> createState() => _CurrencyFormState();
}

class _CurrencyFormState extends State<CurrencyForm> {
  double result = 0;
  bool showError = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleConvertion() {
      setState(() {
        showError = true;
        result = context.read<CurrencyProvider>().calculateExchangeRate(
          textEditingController.text,
        );
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        CurrencyTextDisplay(result: result),
        CurrencySelector(),
        CurrencyInput(
          controller: textEditingController,
          showError: showError,
          onFieldSubmitted: (_) {
            handleConvertion();
          },
        ),
        ConvertButton(onPressed: handleConvertion),
        const ErrorText(),
      ],
    );
  }
}
