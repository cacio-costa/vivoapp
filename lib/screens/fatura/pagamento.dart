import 'package:flutter/material.dart';
import 'package:vivoapp/models/fatura.dart';
import 'package:vivoapp/widgets/util.dart';

class PagamentoFatura extends StatelessWidget {
  final Fatura fatura;

  const PagamentoFatura(this.fatura, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Como quer pagar a sua fatura?',
                style: TextStyle(fontSize: 28)),
            Text('Valor da fatura: R\$ ${fatura.valor.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),
            _FormaDePagamento(
              'Pix Copia e Cola',
              const Icon(Icons.pix),
              onclick: () {
                Navigator.of(context).pop({
                  'forma': 'Pix',
                  'pagamentoEfetudo': true,
                });
              },
            ),
            _FormaDePagamento(
              'Copiar código de barras',
              const Icon(Icons.copy),
              onclick: () {
                Navigator.of(context).pop({
                  'forma': 'Código de barras',
                  'pagamentoEfetudo': false,
                });
              },
            ),
            _FormaDePagamento(
              'Visa/Master **** 1234',
              const Icon(Icons.credit_card),
              onclick: () {
                Navigator.of(context).pop({
                  'forma': 'Cartão de crédito',
                  'pagamentoEfetudo': true,
                });
              },
            ),
            _FormaDePagamento(
              'Novo cartão de crédito',
              const Icon(Icons.wallet),
              onclick: () {
                Navigator.of(context).pop({
                  'forma': 'Novo cartão de crédito',
                  'pagamentoEfetudo': false,
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Gerenciar cartões >',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((rota) => rota.isFirst);
                  },
                  child: const Text(
                    'Tela inicial',
                    style: TextStyle(fontSize: 14),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FormaDePagamento extends StatelessWidget {
  final Icon icone;
  final String rotulo;

  void Function()? onclick;

  _FormaDePagamento(this.rotulo, this.icone, {this.onclick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: 80,
        decoration: boxDecorationComum(),
        child: Center(
          child: ListTile(
            leading: icone,
            title: Text(rotulo),
          ),
        ),
      ),
    );
  }
}
