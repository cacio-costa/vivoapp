import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:vivoapp/models/chamado.dart';

const String _BASE_URL = 'http://localhost:3000';

Future<List<Chamado>> listaChamados() async {
  Uri uri = Uri.parse('$_BASE_URL/chamados');
  http.Response resposta = await http.get(uri);

  if (resposta.statusCode == 200) {
    List<dynamic> listaJson = jsonDecode(resposta.body);

    return listaJson.map((json) => Chamado.fromJson(json))
        .toList();
  } else {
    debugPrint('ERRO: ${resposta.body}');
    throw Exception('Erro ao buscar chamados');
  }
}

Future<Chamado> cadastraChamado(Chamado chamado) async {
  http.Response resposta = await http.post(
    Uri.parse('$_BASE_URL/chamados'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(chamado.toJson()),
  );

  if (resposta.statusCode == 201) {
    return Chamado.fromJson(jsonDecode(resposta.body));
  } else {
    debugPrint('ERRO: ${resposta.body}');
    throw Exception('Erro ao criar chamado');
  }
}