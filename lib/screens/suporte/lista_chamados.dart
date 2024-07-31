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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _chamados.length,
          itemBuilder: (context, index) {
            return _CardChamado(_chamados[index]);
          },
        ),
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
                  if (chamado != null) {setState(() => _chamados.add(chamado))},
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

class _CardChamado extends StatefulWidget {
  final Chamado _chamado;

  const _CardChamado(this._chamado, {super.key});

  @override
  State<_CardChamado> createState() => _CardChamadoState();
}

class _CardChamadoState extends State<_CardChamado> {
  bool selecionado = false;
  Icon? icone;

  @override
  void initState() {
    super.initState();

    icone = widget._chamado.fechado
        ? const Icon(Icons.check_circle, color: Colors.green)
        : const Icon(Icons.error_outline, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    var abertura =
        DateFormat('dd/MM/yyyy').format(widget._chamado.dataDeAbertura);

    return InkWell(
      onTap: () => setState(() => selecionado = !selecionado),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selecionado ? Colors.grey.shade300: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        alignment: Alignment.center,
        child: ListTile(
          leading: icone,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: '${widget._chamado.titulo}\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: 'Aberto em $abertura',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ),
          subtitle: Text(widget._chamado.descricao,
              maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
