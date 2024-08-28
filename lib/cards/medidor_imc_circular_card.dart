import 'package:calculo_imc/widgets/card_customizado.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MedidorImcCircularCard extends StatefulWidget {
  final double? imc;

  const MedidorImcCircularCard({super.key, required this.imc});

  @override
  State<MedidorImcCircularCard> createState() => _MedidorImcCircularCardState();
}

class _MedidorImcCircularCardState extends State<MedidorImcCircularCard> {
  @override
  Widget build(BuildContext context) {
    return CardCustomizado(
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
          value: widget.imc ?? 0.0,
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
