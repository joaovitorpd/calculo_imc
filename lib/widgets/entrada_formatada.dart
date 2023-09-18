import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntradaFormatada extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputFormatter formatter;

  const EntradaFormatada(
      {super.key,
      required this.label,
      required this.controller,
      required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
