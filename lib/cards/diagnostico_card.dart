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
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "IMC: ${imc.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey,
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
                  textodiagnosticoIMC,
                  style: const TextStyle(
                    color: Colors.blueGrey,
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
