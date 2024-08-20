import 'package:calculo_imc/cards/cartao_padrao.dart';
import 'package:flutter/material.dart';

class DiagnosticoCard extends StatelessWidget {
  const DiagnosticoCard(
      {super.key, required this.textodiagnosticoIMC, required this.imc});

  final String textodiagnosticoIMC;

  final double imc;

  @override
  Widget build(BuildContext context) {
    return CartaoPadrao(
      child: Column(
        children: [
          Container(
            width: 190,
            //height: 40,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                width: 3,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    key: const ValueKey('resultadoIMC'),
                    "IMC: ${imc.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  key: const ValueKey('diagnosticoIMC'),
                  textodiagnosticoIMC,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
