import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calcule seu IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _calcularIMC() {
    double altura =
        double.parse(_alturaController.text.replaceFirst(r',', '.'));
    double peso = double.parse(_pesoController.text.replaceFirst(',', '.'));

    setState(() {
      print('peso: $peso');
      print('altura: $altura');

      if (peso != 0 && altura != 0) {
        imc = peso / ((altura) * (altura));
      } else {
        imc = 0;
      }

      _diagnosticoIMC();
    });
  }

  void _diagnosticoIMC() {
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
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.help_outline_outlined,
                size: 30,
              ),
              onPressed: () {
                _janelaDeAjuda(context);
              },
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      child: EntradaFormatada(
                        label: 'Peso (Kg)',
                        controller: _pesoController,
                        formatter: PesoInputFormatter(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      child: EntradaFormatada(
                        label: 'Altura (metros)',
                        controller: _alturaController,
                        formatter: AlturaInputFormatter(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 190,
                  height: 40,
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
                      const Text(
                        'IMC: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        imc.toStringAsFixed(2),
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.grey,
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
                    Text(
                      textodiagnosticoIMC,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 200,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: const Text('Calcular IMC'),
                    onPressed: () {
                      _calcularIMC();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntradaFormatada extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputFormatter formatter;

  const EntradaFormatada(
      {super.key,
      required this.label,
      required this.controller,
      required this.formatter});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        formatter,
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}

Future<void> _janelaDeAjuda(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Ajuda",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Um aplicativo para calcular o seu Índice de Massa Corpórea (IMC).",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Primeiro, insira o seu peso medido em Kilogramas (Kg) no formato ###,# (com uma casa decimal).",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Depois, insira sua altura medida em metros (m), no formato #,## (com duas casas decimais).",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Por fim, clique no botão \"Calcular\" para obter seu IMC e classificação.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Desenvolvido por: ",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "João Vitor",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Contato: ",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "joaovitorpd@gmail.com",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              "OK",
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
