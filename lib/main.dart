import 'package:flutter/material.dart';
import 'package:vivoapp/screens/fatura/historico.dart';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HistoricoDeFaturas(),
    );
  }
}
