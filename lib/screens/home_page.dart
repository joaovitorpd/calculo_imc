import 'package:calculo_imc/cards/diagnostico_card.dart';
import 'package:calculo_imc/cards/entrada_cartao.dart';
import 'package:calculo_imc/widgets/janela_de_ajuda.dart';
import 'package:calculo_imc/cards/medidor_circular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double imc = 0;
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  String textodiagnosticoIMC = 'Sem diagnostico';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _alturaController.dispose();
    _pesoController.dispose();
    super.dispose();
  }

  void calcularIMC() {
    double altura =
        double.parse(_alturaController.text.replaceFirst(r',', '.'));
    double peso = double.parse(_pesoController.text.replaceFirst(',', '.'));

    setState(() {
      //print('peso: $peso');
      //print('altura: $altura');

      if (peso != 0 && altura != 0) {
        imc = peso / ((altura) * (altura));
      } else {
        imc = 0;
      }

      diagnosticoIMC();
    });
  }

  void diagnosticoIMC() {
    if (imc < 18.5) {
      textodiagnosticoIMC = 'Magreza';
    } else if (imc >= 18.5 && imc <= 24.9) {
      textodiagnosticoIMC = 'Normal';
    } else if (imc >= 25.0 && imc <= 29.9) {
      textodiagnosticoIMC = 'Sobrepeso';
    } else if (imc >= 30 && imc <= 39.9) {
      textodiagnosticoIMC = 'Obesidade';
    } else if (imc >= 40) {
      textodiagnosticoIMC = 'Obesidade Grave';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              icon: const Icon(
                Icons.help_outline_outlined,
                size: 30,
              ),
              onPressed: () {
                janelaDeAjuda(context);
              },
              iconSize: 40,
            ),
          ],
        ),
        //resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EntradaCartao(
                  alturaController: _alturaController,
                  pesoController: _pesoController,
                  calcularIMC: calcularIMC),
              MedidorCircular(imc: imc),
              DiagnosticoCard(
                  textodiagnosticoIMC: textodiagnosticoIMC, imc: imc),
            ],
          ),
        ),
      ),
    );
  }
}
