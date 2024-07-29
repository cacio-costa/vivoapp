import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vivoapp/models/chamado.dart';

class ListaDeChamados extends StatefulWidget {
  const ListaDeChamados({super.key});

  @override
  State<ListaDeChamados> createState() => _ListaDeChamadosState();
}

class _ListaDeChamadosState extends State<ListaDeChamados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chamados')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: [
            _CardChamado(
              Chamado(
                titulo: 'O Palmeiras tem mundial sim!',
                dataDeAbertura: DateTime(2024, 7, 26),
                descricao:
                'invenire vituperata tation deserunt felis meliore ius fuisset te aliquet harum class lacinia malorum usu tacimates evertitur nec referrentur tibique nullam quaestio sed ludus phasellus accommodare nulla natoque ut nobis mutat graeco mnesarchum habitasse scripserit dicunt nonumes epicuri dolor sea',
              ),
            ),
            Divider(),
            _CardChamado(
              Chamado(
                titulo: 'Quiz foi difícil',
                dataDeAbertura: DateTime(2024, 7, 25),
                descricao:
                'graece gravida pellentesque labores esse facilisi signiferumque tale moderatius viris',
              ),
            ),
            Divider(),
            _CardChamado(
              Chamado(
                titulo: 'Disponibilizar código fonte',
                dataDeAbertura: DateTime(2024, 7, 24),
                descricao:
                    'simul saperet sapientem vim elaboraret urna graece mediocrem lacinia eloquentiam in similique assueverit adolescens tacimates partiendo pertinax propriae elit est',
              ),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating action button clicado...');
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
    // formata data de abertura padrão dd/MM/yyyy
    var abertura = DateFormat('dd/MM/yyyy').format(_chamado.dataDeAbertura);

    Icon icone = _chamado.fechado
        ? const Icon(Icons.check_circle, color: Colors.green)
        : const Icon(Icons.error_outline, color: Colors.grey);

    return ListTile(
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
              TextSpan(text: 'Aberto em $abertura', style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
      subtitle: Text(_chamado.descricao,
          maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
