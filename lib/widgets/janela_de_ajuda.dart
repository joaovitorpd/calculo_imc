// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

Future<void> janelaDeAjuda(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      String desenvolvedor = "João Vitor Pires Dias";
      return AlertDialog(
        title: Text(
          "Ajuda",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: SingleChildScrollView(
          padding: const EdgeInsets.all(1.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Wrap(
                  children: [
                    Text(
                      """Um aplicativo para calcular o seu Índice de Massa Corpórea (IMC).
Primeiro, insira o seu peso medido em Kilogramas (Kg), no formato ###,# (com uma casa decimal).
Depois, insira sua altura, medida em metros (m), no formato #,## (com duas casas decimais).
Por fim, clique no botão "Calcular", para obter seu IMC e classificação.""",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Desenvolvido por: ${desenvolvedor}",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Wrap(
                    children: [
                      Text(
                        "Contato: ",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "joaovitorpd@gmail.com",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
