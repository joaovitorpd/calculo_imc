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
      title: 'Flutter Demo',
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  fit: FlexFit.loose,
                  // ignore: prefer_const_constructors
                  child: Text(
                    'IMC: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    imc.toStringAsFixed(2),
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
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
            Container(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                child: const Text('Calcular IMC'),
                onPressed: () {
                  _calcularIMC();
                },
              ),
            ),
          ],
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
