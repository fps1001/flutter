// lib/widgets/sliding_up_panel.dart
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpPanelWidget extends StatelessWidget {
  final String etiqueta;
  final Widget body;

  const SlidingUpPanelWidget(
      {super.key, required this.etiqueta, required this.body});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: Center(
        child: Text(
          etiqueta.isNotEmpty
              ? 'Etiqueta: $etiqueta'
              : 'Introduce una matrícula para obtener la etiqueta',
        ),
      ),
      body: body,
    );
  }
}
