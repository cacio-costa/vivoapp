import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/services/api.dart';
import 'package:vivoapp/models/chamado.dart';
import 'package:vivoapp/providers/usuario_provider.dart';

class FormularioNovoChamado extends StatefulWidget {
  const FormularioNovoChamado({super.key});

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
                  const Text('Título do chamado', style: TextStyle(fontSize: 28)),
                  TextFormField(
                    controller: campoTitulo,
                    decoration: const InputDecoration(
                      hintText: 'Descreva o seu problema',
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text('Descreva o seu problema',
                      style: TextStyle(fontSize: 28)),
                  TextFormField(
                    controller: campoDescricao,
                    decoration: const InputDecoration(
                      hintText: 'Descreva o seu problema',
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: FilledButton(
                      onPressed: () {
                        String id = context.read<UsuarioProvider>().usuario!.id;
                        criaChamado(id).then(
                          (chamado) => Navigator.of(context).pop(chamado),
                        );
                      },
                      child: const Text('Enviar chamado'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<Chamado> criaChamado(String userId) async {
    return cadastraChamado(
      Chamado(
        userId: userId,
        titulo: campoTitulo.text,
        dataDeAbertura: DateTime.now(),
        descricao: campoDescricao.text,
      ),
    );
  }
}
