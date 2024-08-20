import 'package:calculo_imc/config/color_schemes.g.dart';
import 'package:calculo_imc/config/text_schemes.dart';
import 'package:calculo_imc/models/imc.dart';
import 'package:calculo_imc/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppCalculoIMC());
}

class AppCalculoIMC extends StatelessWidget {
  AppCalculoIMC({super.key});
  final ImcController imcController = ImcController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: lightTextSchemes),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: darkTextSchemes),
      home: HomePage(
        title: 'Calcule seu IMC',
        imcController: imcController,
      ),
    );
  }
}
