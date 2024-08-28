import 'package:flutter/material.dart';

class CardCustomizado extends StatelessWidget {
  final double elevation;
  final EdgeInsets padding;
  final Widget child;

  const CardCustomizado(
      {super.key,
      this.elevation = 5.0,
      this.padding = const EdgeInsets.all(10.0),
      required this.child}); // Define um valor padrão de elevação

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation, // Usa o valor padrão ou o valor fornecido
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
