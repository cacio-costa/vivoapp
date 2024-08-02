import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/providers/usuario_provider.dart';
import 'package:vivoapp/screens/home.dart';
import 'package:vivoapp/widgets/util.dart';

class FormularioDeLogin extends StatefulWidget {
  const FormularioDeLogin({super.key});

  @override
  State<FormularioDeLogin> createState() => _FormularioDeLoginState();
}

class _FormularioDeLoginState extends State<FormularioDeLogin> {
  final _campoEmail = TextEditingController();
  final _campoSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                const Text('E-mail:', style: TextStyle(fontSize: 28)),
                TextFormField(
                  controller: _campoEmail,
                  decoration: const InputDecoration(
                    hintText: 'Digite o seu e-mail',
                  ),
                ),
                const SizedBox(height: 40),
                const Text('Senha', style: TextStyle(fontSize: 28)),
                TextFormField(
                  controller: _campoSenha,
                  decoration: const InputDecoration(
                    hintText: 'Digite a sua senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Center(
                  child: FilledButton(
                    onPressed: () {
                      if ((_campoEmail.text == 'fulano@email.com')
                        &&(_campoSenha.text == '123')) {

                        Usuario usuario = Usuario(
                          id: Usuario.ULID,
                          nome: 'Fulano',
                          email: _campoEmail.text,
                        );


                        context.read<UsuarioProvider>().login(usuario)
                          .then((_) =>
                            Navigator.of(context)
                                .pushReplacement(rotaDeslizante(const Home()))
                          );
                      }
                    },
                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
