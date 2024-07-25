import 'package:flutter/material.dart';
import 'package:vivoapp/widgets/card_fatura.dart';

class HistoricoDeFaturas extends StatelessWidget {
  const HistoricoDeFaturas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de faturas'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CardFatura(
              153.0,
              '25/04',
              aberta: true,
            ),
            CardFatura(146.0, '25/03', atrasada: true),
            CardFatura(146.0, '25/02'),
            CardFatura(149.0, '25/01'),
          ],
        ),
      ),
    );
  }
}
