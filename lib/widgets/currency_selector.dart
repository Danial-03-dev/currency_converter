import 'package:pak_rupee_converter/providers/currency_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currencies = context.select<CurrencyProvider, List<String>>(
      (provider) => provider.rates.keys.toList(),
    );

    final currency = context.select<CurrencyProvider, String>(
      (provider) => provider.currency,
    );

    if (currencies.isEmpty) return const SizedBox();

    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    return DropdownSearch<String>(
      items: (_, _) {
        return currencies;
      },
      selectedItem: currency,
      onChanged: (value) {
        if (value != null) {
          context.read<CurrencyProvider>().setCurrency(value);
        }
      },

      popupProps: const PopupProps.dialog(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(hintText: 'Search currency...'),
        ),
      ),

      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
