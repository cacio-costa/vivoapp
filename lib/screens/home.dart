import 'package:flutter/material.dart';
import 'package:vivoapp/widgets/acesso_rapido.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: AcessoRapido(),
      ),
    );
  }
}

