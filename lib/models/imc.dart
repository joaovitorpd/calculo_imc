class ImcController {
  double imc = 0;

  double calcularIMC(double altura, double peso) {
    if (peso == 0 || altura == 0) return 0;
    return peso / (altura * altura);
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
