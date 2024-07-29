import 'package:flutter/material.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/widgets/acesso_rapido.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vivo App')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: AcessoRapido(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating action button clicado...');
        },
        child: const Icon(Icons.phone),
      )
    );
  }
}

