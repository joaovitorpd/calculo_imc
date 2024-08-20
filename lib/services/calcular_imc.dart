class CalcularIMC {
  double calcularIMC(double altura, double peso) {
    if (peso == 0 || altura == 0) return 0;
    return peso / (altura * altura);
  }
}
