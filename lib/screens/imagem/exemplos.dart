import 'package:flutter/material.dart';
import 'package:vivoapp/widgets/chamada.dart';

class ExemploDecorationImage extends StatelessWidget {
  const ExemploDecorationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de DecorationImage')),
      body: Center(
        child: PainelChamada(),
      ),
    );
  }
}


