// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BotaoPadraoAcao extends StatelessWidget {
  const BotaoPadraoAcao({
    super.key,
    required this.textoDoBotao,
    required this.funcaoDoBotao,
  });

  final VoidCallback funcaoDoBotao;

  final String textoDoBotao;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        //style: ButtonStyle(padding: ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.primaryContainer,
            padding: EdgeInsets.only(top: 16, right: 24, bottom: 16, left: 24)),
        child: Text(
          'Calcular IMC',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        onPressed: () {
          funcaoDoBotao();
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
