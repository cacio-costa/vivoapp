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
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _widgetPesado('Texto 1', Colors.red, Colors.yellow),
              _widgetPesado('Texto 2', Colors.green, Colors.amber),
              _botaoCurtir(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _botaoCurtir() {
    return IconButton(
      icon: Icon(
        curtido ? Icons.thumb_down_off_alt_outlined : Icons.thumb_up,
        size: 50,
      ),
      onPressed: () => setState(() => curtido = !curtido),
    );
  }

  Widget _widgetPesado(String texto, Color base, Color highlight) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
