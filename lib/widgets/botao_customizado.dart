import 'package:flutter/material.dart';

class BotaoCustomizado extends StatelessWidget {
  const BotaoCustomizado({
    super.key,
    required this.textoDoBotao,
    required this.funcaoDoBotao,
  });

  final void Function()? funcaoDoBotao;

  final String textoDoBotao;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        key: key,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primaryContainer,
            padding: const EdgeInsets.only(
                top: 16, right: 24, bottom: 16, left: 24)),
        onPressed: funcaoDoBotao,
        child: Text(
          'Calcular IMC',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
