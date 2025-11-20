import 'package:currency_converter/widgets/convert_button.dart';
import 'package:currency_converter/widgets/currency_input.dart';
import 'package:currency_converter/widgets/currency_text_display.dart';
import 'package:currency_converter/widgets/home_page_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double result = 0;
  final exchangeRate = 284.17;
  final TextEditingController textEditingController = TextEditingController();

  void handleConvertion() {
    setState(() {
      result = double.parse(textEditingController.text) * exchangeRate;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 612),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              CurrencyTextDisplay(result: result),
              CurrencyInput(controller: textEditingController),
              ConvertButton(onPressed: handleConvertion),
            ],
          ),
        ),
      ),
    );
  }
}
