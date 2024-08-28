import 'package:calculo_imc/models/operacoes_imc.dart';
import 'package:calculo_imc/screens/home_page.dart';
import 'package:calculo_imc/widgets/botao_customizado.dart';
import 'package:calculo_imc/widgets/text_form_field_customizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Teste de Widget - Página de Cálculo de IMC', () {
    testWidgets('Testa se a HomePage é renderizada corretamente',
        (WidgetTester tester) async {
      // Constrói o widget HomePage dentro do ambiente de teste
      await tester.pumpWidget(MaterialApp(
        home: HomePage(
          title: 'Calcule seu IMC',
          operacoesImc: OperacoesImc(),
        ),
      ));

      // Verifica se o título é exibido
      expect(find.text('Calcule seu IMC'), findsOneWidget);

      // Verifica se os campos de entrada de altura e peso estão presentes e
      // inicializados corretamente
      var campoAltura = find.byKey(const ValueKey('altura'));
      TextFormFieldCustomizado textoCampoAltura =
          tester.firstWidget(campoAltura);

      expect(textoCampoAltura.controller.text, '');

      var campoPeso = find.byKey(const ValueKey('peso'));
      TextFormFieldCustomizado textoCampoPeso = tester.firstWidget(campoPeso);

      expect(textoCampoPeso.controller.text, '');

      // Verifica se o botão de calcular IMC está presente
      var botaoCalcular = find.byKey(const ValueKey('botao_calcular'));
      BotaoCustomizado botaoCustomizado = tester.firstWidget(botaoCalcular);
      expect(botaoCustomizado.textoDoBotao, "Calcular IMC");
    });

    testWidgets('Testa se o cálculo de IMC exibe o diagnóstico correto',
        (WidgetTester tester) async {
      // Constrói o widget HomePage dentro do ambiente de teste
      await tester.pumpWidget(MaterialApp(
        home: HomePage(
          title: 'Calcule seu IMC',
          operacoesImc: OperacoesImc(),
        ),
      ));

      // Localiza os campos de texto e o botão
      final alturaFinder = find.byKey(const ValueKey('altura'));
      final pesoFinder = find.byKey(const ValueKey('peso'));
      final botaoCalculoFinder = find.text('Calcular IMC');

      // Insere valores de altura e peso nos campos de texto
      await tester.enterText(alturaFinder, '1.75');
      await tester.enterText(pesoFinder, '70');

      // Simula o clique no botão "Calcular IMC"
      await tester.tap(botaoCalculoFinder);

      // Reconstroi o widget com as interações anteriores
      await tester.pump();

      // Verifica se o IMC calculado é exibido corretamente
      expect(find.text('IMC: 22.86'), findsOneWidget);

      // Verifica se o diagnóstico correspondente ao IMC é exibido corretamente
      expect(find.text('Normal'), findsOneWidget);
    });
  });
}
