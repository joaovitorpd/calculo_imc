import 'package:brasil_fields/brasil_fields.dart';
import 'package:calculo_imc/cards/cartao_padrao.dart';
import 'package:calculo_imc/models/imc.dart';
import 'package:calculo_imc/widgets/botao_padrao_acao.dart';
import 'package:calculo_imc/widgets/entrada_formatada.dart';
import 'package:flutter/material.dart';

class EntradaCartao extends StatelessWidget {
  const EntradaCartao(
      {super.key,
      required this.alturaController,
      required this.pesoController,
      required this.funcaoDoBotao,
      required this.imcController,
      required this.formKey});

  final TextEditingController alturaController;
  final TextEditingController pesoController;
  final Key formKey;
  final ImcController imcController;

  final void Function()? funcaoDoBotao;

  String? _validarAltura(String? altura) {
    if (altura == null || altura.isEmpty) {
      return 'Insira um valor';
    }
    return null;
  }

  String? _validarPeso(String? peso) {
    if (peso == null || peso.isEmpty) {
      return 'Insira um valor';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CartaoPadrao(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EntradaFormatada(
                  label: 'Peso (Kg)',
                  controller: pesoController,
                  formatter: PesoInputFormatter(),
                  okDoTeclado: funcaoDoBotao,
                  validarCampo: _validarPeso,
                ),
                EntradaFormatada(
                  label: 'Altura (m)',
                  controller: alturaController,
                  formatter: AlturaInputFormatter(),
                  okDoTeclado: funcaoDoBotao,
                  validarCampo: _validarAltura,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          BotaoPadraoAcao(
              textoDoBotao: "Calcular IMC", funcaoDoBotao: funcaoDoBotao),
        ],
      ),
    );
  }
}
