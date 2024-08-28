import 'package:calculo_imc/main.dart';
import 'package:calculo_imc/widgets/botao_customizado.dart';
import 'package:calculo_imc/widgets/text_form_field_customizado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end test', () {
    testWidgets('Initial values test', (tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(AppCalculoIMC());

      var alturaInicial = find.byKey(const ValueKey('altura'));
      TextFormFieldCustomizado textoAlturaInicial =
          tester.firstWidget(alturaInicial);

      expect(textoAlturaInicial.controller.text, '');

      var pesoInicial = find.byKey(const ValueKey('peso'));
      TextFormFieldCustomizado textoPesoInicial =
          tester.firstWidget(pesoInicial);

      expect(textoPesoInicial.controller.text, '');

      var imcResultado = find.byKey(const ValueKey('resultadoIMC'));
      Text textoResultado = tester.firstWidget(imcResultado);

      // Verify that our IMC starts at 0 with correct diagnoses.
      expect(textoResultado.data, 'IMC: 0.00');

      var imcDiagnostico = find.byKey(const ValueKey('diagnosticoIMC'));
      Text textoDiagnostico = tester.firstWidget(imcDiagnostico);

      expect(textoDiagnostico.data, 'Sem diagnostico');
    });

    testWidgets('Thinness calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '50.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoCustomizado, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('15.43'), findsOneWidget);
      expect(find.textContaining('Magreza'), findsOneWidget);
    });

    testWidgets('Normal calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '70.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoCustomizado, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('21.60'), findsOneWidget);
      expect(find.textContaining('Normal'), findsOneWidget);
    });

    testWidgets('Overweight calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '90.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoCustomizado, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('27.78'), findsOneWidget);
      expect(find.textContaining('Sobrepeso'), findsOneWidget);
    });

    testWidgets('Obesity calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '110.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoCustomizado, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('33.95'), findsOneWidget);
      expect(find.textContaining('Obesidade'), findsOneWidget);
    });

    testWidgets('Severe Obesity calculation', (tester) async {
      await tester.pumpWidget(AppCalculoIMC());

      await tester.enterText(find.byKey(const ValueKey('altura')), '1.80');
      await tester.enterText(find.byKey(const ValueKey('peso')), '150.0');

      // Tap the 'Calcular IMC' button and trigger a frame.
      await tester.tap(find.widgetWithText(BotaoCustomizado, "Calcular IMC"));
      await tester.pump();

      expect(find.textContaining('46.30'), findsOneWidget);
      expect(find.textContaining('Obesidade Grave'), findsOneWidget);
    });
  });
}
