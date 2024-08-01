import 'dart:math';

import 'package:flutter/material.dart';

class ExemploStatelessStateful extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      debugShowCheckedModeBanner: false,
      home: ListagemQualquer(),
    );
  }
}

class ListagemQualquer extends StatefulWidget {
  const ListagemQualquer({super.key});

  @override
  State<ListagemQualquer> createState() => _ListagemQualquerState();
}

class _ListagemQualquerState extends State<ListagemQualquer> {

  List<String> dados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Listagem de dados')
      ),
    );
  }
}
