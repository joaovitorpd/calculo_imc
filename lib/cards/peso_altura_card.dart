import 'package:brasil_fields/brasil_fields.dart';
import 'package:calculo_imc/widgets/card_customizado.dart';
import 'package:calculo_imc/models/operacoes_imc.dart';
import 'package:calculo_imc/widgets/botao_customizado.dart';
import 'package:calculo_imc/widgets/text_form_field_customizado.dart';
import 'package:flutter/material.dart';

class PesoAlturaCard extends StatelessWidget {
  const PesoAlturaCard(
      {super.key,
      required this.alturaController,
      required this.pesoController,
      required this.funcaoDoBotao,
      required this.imcController,
      required this.formKey});

  final TextEditingController alturaController;
  final TextEditingController pesoController;
  final Key formKey;
  final OperacoesImc imcController;

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
    return CardCustomizado(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormFieldCustomizado(
                  key: const ValueKey('peso'),
                  label: 'Peso (Kg)',
                  controller: pesoController,
                  formatter: PesoInputFormatter(),
                  okDoTeclado: funcaoDoBotao,
                  validarCampo: _validarPeso,
                ),
                TextFormFieldCustomizado(
                  key: const ValueKey('altura'),
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
          BotaoCustomizado(
            textoDoBotao: "Calcular IMC",
            funcaoDoBotao: funcaoDoBotao,
            key: const ValueKey('botao_calcular'),
          ),
        ],
      ),
    );
  }
}
