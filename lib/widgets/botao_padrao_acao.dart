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
      //width: 200,
      //height: 50,
      child: ElevatedButton(
        child: const Text(
          'Calcular IMC',
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          funcaoDoBotao();
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
