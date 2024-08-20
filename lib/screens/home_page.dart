import 'package:calculo_imc/cards/diagnostico_card.dart';
import 'package:calculo_imc/cards/entrada_cartao.dart';
import 'package:calculo_imc/models/imc_controller.dart';
import 'package:calculo_imc/widgets/janela_de_ajuda.dart';
import 'package:calculo_imc/cards/medidor_circular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.imcController});

  final String title;
  final ImcController imcController;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();
  late String diagnosticoDoIMC;
  final _formKey = GlobalKey<FormState>();
  double imc = 0;

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

  void _executarCalculoIMC(
      GlobalKey<FormState> chave,
      TextEditingController alturaController,
      TextEditingController pesoController) {
    if (chave.currentState!.validate()) {
      setState(() {
        final altura = _trocarVirgulaPorPonto(controller: alturaController);
        final peso = _trocarVirgulaPorPonto(controller: pesoController);
        imc = widget.imcController.calcularIMC(altura, peso);
        FocusScope.of(context).unfocus();
      });
    }
  }

  //The method trocarVirgulaPorPonto is needed because the package Brasil Fields
  //puts a "," (comma) instead of a "." (period) in the value of the controller.
  double _trocarVirgulaPorPonto({required TextEditingController controller}) =>
      controller.text.isNotEmpty
          ? double.parse(controller.text.replaceFirst(r',', '.'))
          : 0;

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
                funcaoDoBotao: () => _executarCalculoIMC(
                    _formKey, _alturaController, _pesoController),
                imcController: widget.imcController,
                formKey: _formKey,
              ),
              MedidorCircular(imc: imc),
              DiagnosticoCard(
                  textodiagnosticoIMC: widget.imcController.diagnosticar(imc),
                  imc: imc),
            ],
          ),
        ),
      ),
    );
  }
}
