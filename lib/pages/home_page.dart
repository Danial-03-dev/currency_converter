import 'package:pak_rupee_converter/providers/currency_provider.dart';
import 'package:pak_rupee_converter/widgets/currency_form.dart';
import 'package:pak_rupee_converter/widgets/home_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CurrencyProvider>().fetchRates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 612),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const CurrencyForm(),
        ),
      ),
    );
  }
}
