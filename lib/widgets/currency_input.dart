import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInput extends StatefulWidget {
  final TextEditingController controller;

  const CurrencyInput({super.key, required this.controller});

  @override
  State<CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  bool _touched = false;

  @override
  Widget build(BuildContext context) {
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
        hintText: "Enter amount in USD",
        prefixIcon: const Icon(Icons.monetization_on_outlined),

        enabledBorder: border,
        focusedBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,

        // 👇 Only show error if user has typed (touched)
        errorText: _touched ? _validate(widget.controller.text) : null,
      ),

      onChanged: (value) {
        if (!_touched) {
          setState(() => _touched = true);
        } else {
          setState(() {}); // refresh to update error visibility
        }
      },
    );
  }

  String? _validate(String value) {
    if (value.isEmpty) return "Amount is required";
    final num = double.tryParse(value);
    if (num == null) return "Enter a valid number";
    if (num <= 0) return "Amount must be greater than 0";
    return null;
  }
}
