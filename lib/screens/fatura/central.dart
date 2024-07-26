import 'package:flutter/material.dart';
import 'package:vivoapp/models/fatura.dart';
import 'package:vivoapp/screens/fatura/pagamento.dart';
import 'package:vivoapp/widgets/fatura/painel_controle.dart';

class CentralDeFaturas extends StatefulWidget {
  const CentralDeFaturas({super.key});

  @override
  State<CentralDeFaturas> createState() => _CentralDeFaturasState();
}

class _CentralDeFaturasState extends State<CentralDeFaturas> {
  List<Fatura> _faturas = [];

  @override
  void initState() {
    super.initState();
    _faturas = [
      Fatura(
        valor: 158.0,
        vencimento: DateTime(2024, 7, 25),
        id: 4,
      ),
      Fatura(
        valor: 157.0,
        vencimento: DateTime(2024, 6, 25),
        id: 3,
        status: StatusFatura.atrasada,
      ),
      Fatura(
          valor: 156.0,
          vencimento: DateTime(2024, 5, 25),
          id: 2,
          status: StatusFatura.paga),
      Fatura(
        valor: 155.0,
        vencimento: DateTime(2024, 4, 25),
        id: 1,
        status: StatusFatura.paga,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Central de faturas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final fatura = _faturas[index];
            return PainelControleFatura(
              fatura: fatura,
              onPagamento: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => PagamentoFatura(fatura),
                    ))
                    .then(
                      (resposta) {
                        if (resposta != null && resposta['pagamentoEfetudo']) {
                          setState(() {
                            fatura.status = StatusFatura.paga;
                          });
                        }
                      },
                    );
              },
            );
          },
          itemCount: _faturas.length,
        ),
      ),
    );
  }
}
