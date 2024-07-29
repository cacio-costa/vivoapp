import 'package:flutter/material.dart';
import 'package:vivoapp/screens/home.dart';
import 'package:vivoapp/screens/imagem/exemplos.dart';
import 'package:vivoapp/screens/leiaute/exemplos.dart';
import 'package:vivoapp/screens/login/formulario.dart';
import 'package:vivoapp/screens/suporte/formulario_novo_chamado.dart';
import 'package:vivoapp/screens/suporte/lista_chamados.dart';
import 'package:vivoapp/temas.dart';
import 'package:intl/intl.dart';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      theme: TEMA_CLARO,
      home: FormularioDeLogin(),

    );

  }
}
