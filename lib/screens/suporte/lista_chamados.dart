import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivoapp/models/chamado.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/screens/suporte/formulario_novo_chamado.dart';

class ListaDeChamados extends StatefulWidget {
  ListaDeChamados({super.key});

  @override
  State<ListaDeChamados> createState() => _ListaDeChamadosState();
}

class _ListaDeChamadosState extends State<ListaDeChamados> {
  List<Chamado> _chamados = [
    Chamado(
      userId: 1,
      titulo: 'O Palmeiras tem mundial sim!',
      dataDeAbertura: DateTime(2024, 7, 26),
      descricao:
          'invenire vituperata tation deserunt felis meliore ius fuisset te aliquet harum class lacinia malorum usu tacimates evertitur nec referrentur tibique nullam quaestio sed ludus phasellus accommodare nulla natoque ut nobis mutat graeco mnesarchum habitasse scripserit dicunt nonumes epicuri dolor sea',
    ),
    Chamado(
      userId: 1,
      titulo: 'Quiz foi difícil',
      dataDeAbertura: DateTime(2024, 7, 25),
      descricao:
          'graece gravida pellentesque labores esse facilisi signiferumque tale moderatius viris',
    ),
    Chamado(
      userId: 1,
      titulo: 'Disponibilizar código fonte',
      dataDeAbertura: DateTime(2024, 7, 24),
      descricao:
          'simul saperet sapientem vim elaboraret urna graece mediocrem lacinia eloquentiam in similique assueverit adolescens tacimates partiendo pertinax propriae elit est',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chamados')),
      body: ListView(
        children: [
          _CardChamado(_chamados[0]),
          _CardChamado(_chamados[1]),
          _CardChamado(_chamados[2]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute<Chamado?>(
                  builder: (context) => FormularioNovoChamado(),
                ),
              )
              .then(
                (chamado) => {
                  print(chamado),
                  if (chamado != null) {_chamados.add(chamado)},

                },
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CardChamado extends StatelessWidget {
  final Chamado _chamado;

  const _CardChamado(this._chamado, {super.key});

  @override
  Widget build(BuildContext context) {
    var abertura = DateFormat('dd/MM/yyyy').format(_chamado.dataDeAbertura);

    Icon icone = _chamado.fechado
        ? const Icon(Icons.check_circle, color: Colors.green)
        : const Icon(Icons.error_outline, color: Colors.grey);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        leading: icone,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: '${_chamado.titulo}\n',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: 'Aberto em $abertura',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
        subtitle: Text(_chamado.descricao,
            maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
