import 'package:flutter/material.dart';

Future<void> janelaDeAjuda(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Ajuda",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: SingleChildScrollView(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Expanded(
                  child: Text(
                    """Um aplicativo para calcular o seu Índice de Massa Corpórea (IMC).
Primeiro, insira o seu peso medido em Kilogramas (Kg) no formato ###,# (com uma casa decimal).
Depois, insira sua altura medida em metros (m), no formato #,## (com duas casas decimais).
Por fim, clique no botão "Calcular" para obter seu IMC e classificação.""",
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
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
