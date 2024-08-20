// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculo_imc/main.dart';
import 'package:calculo_imc/widgets/botao_padrao_acao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test App', () {
    testWidgets('Initial values App test', (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(AppCalculoIMC());

      var imcResultado = find.byKey(const ValueKey('resultadoIMC'));
      Text textoAltura = tester.firstWidget(imcResultado);

      // Verify that our IMC starts at 0 with correct diagnoses.
      expect(textoAltura.data, 'IMC: 0.00');

      var imcDiagnostico = find.byKey(const ValueKey('diagnosticoIMC'));
      Text textoPeso = tester.firstWidget(imcDiagnostico);

      expect(textoPeso.data, findsOneWidget);
    });
    testWidgets('Overweight calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '90.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoPadraoAcao, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('27.78'), findsOneWidget);
      expect(find.textContaining('Sobrepeso'), findsOneWidget);
    });
  });
}
