import 'package:brasil_fields/brasil_fields.dart';
import 'package:calculo_imc/widgets/botao_padrao_acao.dart';
import 'package:calculo_imc/widgets/entrada_formatada.dart';
import 'package:flutter/material.dart';

class EntradaCartao extends StatelessWidget {
  const EntradaCartao(
      {super.key,
      required this.alturaController,
      required this.pesoController,
      required this.calcularIMC});

  final TextEditingController alturaController;
  final TextEditingController pesoController;

  final VoidCallback calcularIMC;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EntradaFormatada(
                  label: 'Peso (Kg)',
                  controller: pesoController,
                  formatter: PesoInputFormatter(),
                ),
                EntradaFormatada(
                  label: 'Altura (metros)',
                  controller: alturaController,
                  formatter: AlturaInputFormatter(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BotaoPadraoAcao(
                textoDoBotao: "Calcular IMC", funcaoDoBotao: calcularIMC),
          ],
        ),
      ),
    );
  }
}
