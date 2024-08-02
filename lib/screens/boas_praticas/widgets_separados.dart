import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vivoapp/temas.dart';

class ExemploWidgetsSeparados extends StatefulWidget {
  const ExemploWidgetsSeparados({super.key});

  @override
  State<ExemploWidgetsSeparados> createState() => _ExemploWidgetsSeparadosState();
}

class _ExemploWidgetsSeparadosState extends State<ExemploWidgetsSeparados> {
  bool curtido = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      theme: TEMA_CLARO,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /**
               * Ao invés de métodos auxiliares, widgets separados
               *
                  _widgetPesado('Texto 1', Colors.red, Colors.yellow),
                  _widgetPesado('Texto 2', Colors.green, Colors.amber),
                  _botaoCurtir(),
               */
              TextoAnimado(texto: 'Texto 1', base: Colors.red, highlight: Colors.yellow),
              TextoAnimado(texto: 'Texto 2', base: Colors.green, highlight: Colors.amber),
              BotaoCurtir()
            ],
          ),
        ),
      ),
    );
  }
}

class BotaoCurtir extends StatefulWidget {
  const BotaoCurtir({super.key});

  @override
  State<BotaoCurtir> createState() => _BotaoCurtirState();
}

class _BotaoCurtirState extends State<BotaoCurtir> {
  bool curtido = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        curtido ? Icons.thumb_down_off_alt_outlined : Icons.thumb_up,
        size: 50,
      ),
      onPressed: () => setState(() => curtido = !curtido),
    );
  }
}

class TextoAnimado extends StatelessWidget {
  final String texto;
  final Color base, highlight;

  const TextoAnimado({
    required this.texto,
    required this.base,
    required this.highlight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
