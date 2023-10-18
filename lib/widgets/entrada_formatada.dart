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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            isDense: true,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(16)),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          formatter,
        ],
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
