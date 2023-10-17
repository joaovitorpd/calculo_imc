import 'package:calculo_imc/config/palette.dart';
import 'package:calculo_imc/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCalculoIMC());
}

class AppCalculoIMC extends StatelessWidget {
  const AppCalculoIMC({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      theme: ThemeData(
        primarySwatch: Palette.modoEscuro,
        //cardColor: const Color.fromRGBO(255, 255, 255, 1),
        //scaffoldBackgroundColor: const Color.fromARGB(255, 193, 196, 202)
      ),
      home: const HomePage(title: 'Calcule seu IMC'),
    );
  }
}
