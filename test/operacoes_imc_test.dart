import 'package:calculo_imc/models/operacoes_imc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test for thinness, normal, overweight, obesity ', () {
    test("Calculate Thinness IMC", () {
      final operacoesImc = OperacoesImc();

      var imc = operacoesImc.calcularIMC(1.80, 50.0);
      expect(imc, 15.43);
    });
    test('Calculate Normal IMC', () {
      final operacoesImc = OperacoesImc();
      var imc = operacoesImc.calcularIMC(1.80, 70.0);

      expect(imc, 21.60);
    });

    test('Calculate Overweight IMC', () {
      final operacoesImc = OperacoesImc();
      var imc = operacoesImc.calcularIMC(1.80, 90.0);

      expect(imc, 27.78);
    });

    test('Calculate Obesity IMC', () {
      final operacoesImc = OperacoesImc();
      var imc = operacoesImc.calcularIMC(1.80, 110.0);

      expect(imc, 33.95);
    });

    test('Calculate Severe Obesity IMC', () {
      final operacoesImc = OperacoesImc();
      var imc = operacoesImc.calcularIMC(1.80, 150.0);

      expect(imc, 46.30);
    });
  });
}
