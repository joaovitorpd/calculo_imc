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
            padding: EdgeInsets.only(top: 16, right: 24, bottom: 16, left: 24)),
        child: const Text(
          'Calcular IMC',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        onPressed: () {
          funcaoDoBotao();
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
