import 'package:pak_rupee_converter/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CurrencyInput extends StatefulWidget {
  final TextEditingController controller;
  final bool showError;
  final void Function(String)? onFieldSubmitted;

  const CurrencyInput({
    super.key,
    required this.controller,
    required this.showError,
    this.onFieldSubmitted,
  });

  @override
  State<CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  bool _touched = false;

  String? _validate(String value) {
    if (value.isEmpty) return "Amount is required";
    final num = double.tryParse(value);
    if (num == null) return "Enter a valid number";
    if (num <= 0) return "Amount must be greater than 0";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final currency = context.select<CurrencyProvider, String>(
      (provider) => provider.currency,
    );

    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0),
      borderRadius: BorderRadius.circular(8),
    );
    final errorBorder = border.copyWith(
      borderSide: const BorderSide(color: Colors.red, width: 2),
    );

    return TextFormField(
      controller: widget.controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),

      // Allow only numbers + decimal
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],

      decoration: InputDecoration(
        hintText: "Enter amount in ${currency.toUpperCase()}",
        prefixIcon: const Icon(Icons.monetization_on_outlined),

        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,

        // 👇 Only show error if user has typed (touched)
        errorText: _touched || widget.showError
            ? _validate(widget.controller.text)
            : null,
      ),

      onChanged: (value) {
        if (!_touched) {
          setState(() => _touched = true);
        } else {
          setState(() {}); // refresh to update error visibility
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
