import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/providers/usuario_provider.dart';
import 'package:vivoapp/screens/login/formulario.dart';
import 'package:vivoapp/widgets/acesso_rapido.dart';
import 'package:vivoapp/widgets/chamada.dart';
import 'package:vivoapp/widgets/util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vivo App'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                iconSize: 28,
                onPressed: () {
                  context.read<UsuarioProvider>().logout().then(
                        (_) => Navigator.of(context).pushReplacement(
                          rotaDeslizante(FormularioDeLogin()),
                        ),
                      );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerSaudacao(),
                AvisoDeFaturas(),
                SizedBox(height: 48),
                PainelChamada(),
                SizedBox(height: 48),
                AcessoRapido(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating action button clicado...');
          },
          child: const Icon(Icons.phone),
        ));
  }
}

class AvisoDeFaturas extends StatefulWidget {
  const AvisoDeFaturas({super.key});

  @override
  State<AvisoDeFaturas> createState() => _AvisoDeFaturasState();
}

class _AvisoDeFaturasState extends State<AvisoDeFaturas> {
  double opacidade = 1;
  bool removerAviso = false;

  void removeAviso() {
    setState(() => opacidade = 0);

    Future.delayed(Duration(milliseconds: 800), () {
      setState(() => removerAviso = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (removerAviso) {
      return Container();
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutQuad,
      opacity: opacidade,
      child: Wrap(
        runSpacing: 20,
        children: [
          Text(
            'Você tem prontas para pagar. Quer pagar agora?',
            style: TextStyle(fontSize: 28),
          ),
          FilledButton(onPressed: () {}, child: Text('Pagar faturas')),
          TextButton(
            onPressed: removeAviso,
            child: Text('Ocultar notificação'),
          ),
        ],
      ),
    );
  }
}

class BannerSaudacao extends StatelessWidget {
  const BannerSaudacao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Consumer<UsuarioProvider>(
        builder:
            (BuildContext context, UsuarioProvider provider, Widget? child) {
          return RichText(
            text: TextSpan(
              text: 'Olá, ',
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                  text: '${provider.usuario?.nome ?? ''}.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
