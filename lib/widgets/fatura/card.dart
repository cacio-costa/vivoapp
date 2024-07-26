import 'package:flutter/material.dart';

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