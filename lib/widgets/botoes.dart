import 'package:flutter/material.dart';

class BotaoCard extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String subtitulo;

  final double largura;

  // declara uma função que não recebe parâmetros e não retorna nada
  final void Function() onclick;

  const BotaoCard({
    required this.icone,
    required this.rotulo,
    required this.largura,
    required this.onclick,
    this.subtitulo = '',
    super.key,
  });

  const BotaoCard.pequeno({
    required IconData icone,
    required String rotulo,
    String subtitulo = '',
    required void Function() onclick,
    Key? key,
  }) : this(
    icone: icone,
    rotulo: rotulo,
    subtitulo: subtitulo,
    largura: 166,
    onclick: onclick,
    key: key,
  );

  const BotaoCard.grande({
    required IconData icone,
    required String rotulo,
    String subtitulo = '',
    required void Function() onclick,
    Key? key,
  }) : this(
    icone: icone,
    rotulo: rotulo,
    subtitulo: subtitulo,
    largura: 340,
    onclick: onclick,
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: largura,
          height: 156,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icone, size: 32),
                const SizedBox(height: 12),
                Text(rotulo, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  subtitulo,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
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