import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConvertButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Convert',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
