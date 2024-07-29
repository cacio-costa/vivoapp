import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/providers/usuario_provider.dart';
import 'package:vivoapp/widgets/acesso_rapido.dart';
import 'package:vivoapp/widgets/chamada.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vivo App'),),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 36),
                child: Consumer<UsuarioProvider>(
                  builder: (BuildContext context, UsuarioProvider provider, Widget? child) {
                    return RichText(
                      text: TextSpan(
                        text: 'Olá, ',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                        children: [
                          TextSpan(
                            text: '${provider.usuario!.nome}.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
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
      )
    );
  }
}

