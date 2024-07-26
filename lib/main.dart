import 'package:flutter/material.dart';
import 'package:vivoapp/screens/home.dart';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
      // PagamentoFatura(
      //   Fatura(
      //     valor: 158.0,
      //     vencimento: DateTime(2024, 7, 25),
      //     id: 4,
      //   ),
      // ),
    );
  }
}
