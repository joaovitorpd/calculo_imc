// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:calculo_imc/cards/cartao_padrao.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MedidorCircular extends StatefulWidget {
  final double imc;

  MedidorCircular({super.key, required this.imc});

  @override
  State<MedidorCircular> createState() => _MedidorCircularState();
}

class _MedidorCircularState extends State<MedidorCircular> {
  @override
  Widget build(BuildContext context) {
    return CartaoPadrao(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[4],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0.0,
                  maximum: 60.0,
                  showLastLabel:
                      true, // Defina o máximo de IMC de acordo com sua necessidade
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0, endValue: 18.5, color: Colors.yellow),
                    GaugeRange(
                        startValue: 18.5, endValue: 24.9, color: Colors.green),
                    GaugeRange(
                        startValue: 25.0, endValue: 29.9, color: Colors.orange),
                    GaugeRange(
                        startValue: 30.0, endValue: 60.0, color: Colors.red)
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: widget.imc,
                      needleColor: _getColorForIMC(widget.imc),
                    )
                  ],
                  /* annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(widget.imc.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        angle: 90,
                        positionFactor: 0.5),
                  ] */
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForIMC(double imc) {
    if (imc < 18.5) {
      return Colors.yellow;
    } else if (imc <= 24.9) {
      return Colors.green;
    } else if (imc <= 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
