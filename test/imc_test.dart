import 'package:calculo_imc/models/imc_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test for thinness, normal, overweight, obesity ', () {
    test("Calculate thinness IMC", () {
      final imcController = ImcController();

      var imc = imcController.calcularIMC(1.80, 50.0);
      expect(imc, 15.43);
    });
    test('Calculate normal IMC', () {
      final imcController = ImcController();
      var imc = imcController.calcularIMC(1.80, 70.0);

      expect(imc, 21.60);
    });

    test('Calculate overweight IMC', () {
      final imcController = ImcController();
      var imc = imcController.calcularIMC(1.80, 90.0);

      expect(imc, 27.78);
    });

    test('Calculate obesity IMC', () {
      final imcController = ImcController();
      var imc = imcController.calcularIMC(1.80, 110.0);

      expect(imc, 33.95);
    });
  });
}
