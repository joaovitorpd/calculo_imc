import 'package:flutter/material.dart';

Future<void> JanelaDeAjuda(BuildContext context) {
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
