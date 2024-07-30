import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ulid/ulid.dart';
import 'package:vivoapp/models/chamado.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/screens/suporte/formulario_novo_chamado.dart';
import 'package:vivoapp/services/api.dart';


class ListaDeChamados extends StatefulWidget {
  ListaDeChamados({super.key});

  @override
  State<ListaDeChamados> createState() => _ListaDeChamadosState();
}

class _ListaDeChamadosState extends State<ListaDeChamados> {
  List<Chamado> _chamados = [];

  @override
  void initState() {
    super.initState();
    carregaListaDeChamados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chamados')),
      body: ListView.builder(
        itemCount: _chamados.length,
        itemBuilder: (context, index) {
          return _CardChamado(_chamados[index]);
        },
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
                  if (chamado != null) {
                    setState(() => _chamados.add(chamado))
                  },

                },
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void carregaListaDeChamados() async {
    debugPrint('Buscando chamados');
    _chamados = await listaChamados();
    _chamados.sort((a, b) => b.dataDeAbertura.compareTo(a.dataDeAbertura));
    setState(() {});
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
