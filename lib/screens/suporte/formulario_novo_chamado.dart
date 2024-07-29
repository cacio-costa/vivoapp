import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/models/chamado.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/providers/usuario_provider.dart';

class FormularioNovoChamado extends StatefulWidget {
  FormularioNovoChamado({super.key});

  @override
  State<FormularioNovoChamado> createState() => _FormularioNovoChamadoState();
}

class _FormularioNovoChamadoState extends State<FormularioNovoChamado> {
  final campoTitulo = TextEditingController();
  final campoDescricao = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo chamado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Título do chamado',
                    style: TextStyle(fontSize: 28)),
                TextFormField(
                  controller: campoTitulo,
                  decoration: InputDecoration(
                    hintText: 'Descreva o seu problema',
                  ),
                ),
                SizedBox(height: 40),
                Text('Descreva o seu problema',
                    style: TextStyle(fontSize: 28)),
                TextFormField(
                  controller: campoDescricao,
                  decoration: InputDecoration(
                    hintText: 'Descreva o seu problema',
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 40),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      int id = context.read<UsuarioProvider>().usuario!.id;
                      var chamado = criaChamado(id);
                      Navigator.of(context).pop(chamado);
                    },
                    child: const Text('Enviar chamado'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Chamado criaChamado(int id) {
    return Chamado(
      userId: id,
      titulo: campoTitulo.text,
      dataDeAbertura: DateTime.now(),
      descricao: campoDescricao.text,
    );
  }
}
