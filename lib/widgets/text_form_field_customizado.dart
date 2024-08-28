import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustomizado extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputFormatter formatter;
  final void Function()? okDoTeclado;
  final String? Function(String?)? validarCampo;

  const TextFormFieldCustomizado({
    super.key,
    required this.label,
    required this.controller,
    required this.formatter,
    required this.okDoTeclado,
    required this.validarCampo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        key: key,
        textAlign: TextAlign.start,
        controller: controller,
        validator: validarCampo,
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
        onEditingComplete: okDoTeclado,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
