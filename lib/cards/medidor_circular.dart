// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:calculo_imc/cards/cartao_padrao.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MedidorCircular extends StatefulWidget {
  final double? imc;

  const MedidorCircular({super.key, required this.imc});

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
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                _buildRadialAxis(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadialAxis _buildRadialAxis() {
    return RadialAxis(
      minimum: 0.0,
      maximum: 60.0,
      ranges: <GaugeRange>[
        _buildGaugeRange(0, 18.5, Colors.yellow),
        _buildGaugeRange(18.5, 24.9, Colors.green),
        _buildGaugeRange(25.0, 29.9, Colors.orange),
        _buildGaugeRange(30.0, 60.0, Colors.red),
      ],
      pointers: <GaugePointer>[
        NeedlePointer(
          value: widget.imc!,
          needleColor: _getColorForIMC(widget.imc!),
        ),
      ],
    );
  }

  GaugeRange _buildGaugeRange(double start, double end, Color color) {
    return GaugeRange(
      startValue: start,
      endValue: end,
      color: color,
      labelStyle: GaugeTextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }

  Color _getColorForIMC(double imc) {
    if (imc < 18.5) return Colors.yellow;
    if (imc <= 24.9) return Colors.green;
    if (imc <= 29.9) return Colors.orange;
    return Colors.red;
  }
}
