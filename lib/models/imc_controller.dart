class ImcController {
  double calcularIMC(double altura, double peso) {
    if (peso == 0 || altura == 0) return 0;
    var imc = peso / (altura * altura);
    return double.parse(imc.toStringAsFixed(2));
  }

  String diagnosticar(double imc) {
    if (imc == 0) return "Sem diagnostico";
    if (imc < 18.5) return 'Magreza';
    if (imc < 25.0) return 'Normal';
    if (imc < 30.0) return 'Sobrepeso';
    if (imc < 40.0) return 'Obesidade';
    return 'Obesidade Grave';
  }
}
