import 'package:flutter/material.dart';
import 'package:vivoapp/models/fatura.dart';

class PainelControleFatura extends StatelessWidget {
  Fatura fatura;
  void Function()? onPagamento;

  PainelControleFatura({super.key, required this.fatura, this.onPagamento});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _TopoPainelFatura(fatura),
          const SizedBox(height: 16),
          _DescricaoPainelFatura(fatura),
          Divider(color: Colors.grey[200]),
          _RodapePainelFatura(fatura, onPagamento: onPagamento),
        ],
      ),
    );
  }
}

class _TopoPainelFatura extends StatelessWidget {
  final Fatura fatura;

  const _TopoPainelFatura(
      this.fatura);

  @override
  Widget build(BuildContext context) {
    Map<StatusFatura, Icon> statusIcons = {
      StatusFatura.paga: Icon(
        Icons.check,
        color: Colors.green[800],
      ),
      StatusFatura.atrasada:
      Icon(Icons.watch_later_outlined, color: Colors.red),
      StatusFatura.aberta: Icon(Icons.error_outline, color: Colors.grey),
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            // backgroundColor: Colors.grey[200],
            labelStyle: const TextStyle(color: Colors.black),
            avatar: statusIcons[fatura.status],
            label: Text(fatura.status.name),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            side: const BorderSide(color: Colors.white),
          ),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}

class _DescricaoPainelFatura extends StatelessWidget {
  final Fatura fatura;

  const _DescricaoPainelFatura(this.fatura);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fatura.descricaoVencimento,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                'Fatura de ${fatura.nomeMes}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            'R\$ ${fatura.valor.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 24,
              color: Colors.purple[800],
            ),
          ),
        ],
      ),
    );
  }
}


class _RodapePainelFatura extends StatelessWidget {
  final Fatura fatura;
  void Function()? onPagamento;

  _RodapePainelFatura(this.fatura, {this.onPagamento});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton(
            onPressed: onPagamento,
            // style: ButtonStyle(
            //   backgroundColor: WidgetStateProperty.all(Colors.purple[800]),
            //   padding: WidgetStateProperty.all(
            //     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //   ),
            // ),
            child: const Text(
              'Pagar fatura',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Exibir detalhes >',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}