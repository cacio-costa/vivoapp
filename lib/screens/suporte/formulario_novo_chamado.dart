import 'package:flutter/material.dart';
import 'package:vivoapp/models/chamado.dart';
import 'package:vivoapp/models/usuario.dart';

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
                      var chamado = criaChamado();
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

  Chamado criaChamado() {
    return Chamado(
      userId: 1,
      titulo: campoTitulo.text,
      dataDeAbertura: DateTime.now(),
      descricao: campoDescricao.text,
    );
  }
}
