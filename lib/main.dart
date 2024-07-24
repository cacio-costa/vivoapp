import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Histórico de faturas'),
        ),
        body: const HistoricoDeFaturas(),
      ),
    );
  }
}

/// *************************************
/// Widgets para listagem de faturas    *
///*************************************

class HistoricoDeFaturas extends StatelessWidget {
  const HistoricoDeFaturas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
    );
  }
}

class CardFatura extends StatelessWidget {
  final double valor;
  final String vencimento;

  final bool aberta;
  final bool atrasada;

  const CardFatura(this.valor, this.vencimento,
      {this.aberta = false, this.atrasada = false, super.key});

  @override
  Widget build(BuildContext context) {
    String status = 'Paga';
    Icon icone = const Icon(Icons.check_circle, color: Colors.green);

    if (atrasada) {
      icone = const Icon(Icons.watch_later_outlined, color: Colors.red);
      status = 'Atrasada';
    } else if (aberta) {
      icone = const Icon(Icons.error_outline, color: Colors.grey);
      status = 'Aberta';
    }

    return Card(
      color: Colors.white,
      child: ListTile(
        leading: icone,
        title: Text('Venceu em $vencimento'),
        subtitle: Text(status),
        trailing: Text("R\$ ${valor.toStringAsFixed(2)}",
            style: const TextStyle(color: Colors.black, fontSize: 20.0)),
      ),
    );
  }
}

/// *************************************
/// Widgets para jogo de dados          *
///*************************************

class JogoDeDados extends StatefulWidget {
  const JogoDeDados({super.key});

  @override
  JogoDeDadosState createState() => JogoDeDadosState();
}

class JogoDeDadosState extends State<JogoDeDados> {
  String dado1 = '?';
  String dado2 = '?';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Dado(dado1), const SizedBox(width: 8), Dado(dado2)],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: sorteia,
          child: const Text('Rolar dados'),
        )
      ],
    );
  }

  void sorteia() {
    setState(() {
      dado1 = '${Random().nextInt(6) + 1}';
      dado2 = '${Random().nextInt(6) + 1}';
    });
  }
}

class Dado extends StatelessWidget {
  final String numero;

  const Dado(this.numero, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          numero,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
