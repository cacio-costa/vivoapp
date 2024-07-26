import 'package:flutter/material.dart';
import 'package:vivoapp/screens/home.dart';
import 'package:vivoapp/screens/imagem/exemplos.dart';
import 'package:vivoapp/screens/leiaute/exemplos.dart';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      // home: Home(),
      // home: ExemploDecorationImage(),
      // home: ExemploRichText(),
      // home: ExemploFlexible(),
      // home: ExemploExpanded(),
      // home: ExemploCircleAvatar(),
      // home: ExemploWrap(),
      // home: ExemploFittedBox(),
      // home: ExemploVisibility(),
      home: ExemploSliverAppBar(),
    );

  }
}
