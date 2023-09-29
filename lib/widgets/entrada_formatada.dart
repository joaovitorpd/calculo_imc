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
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
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
