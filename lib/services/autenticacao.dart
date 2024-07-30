import 'dart:convert';
import 'package:vivoapp/models/usuario.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> registraLogin(Usuario usuario) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setBool('logado', true);
  await prefs.setString('usuario', jsonEncode(usuario.toJson()));
}

Future<void> limpaLogin() async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setBool('logado', false);
  await prefs.remove('usuario');
}

Future<bool> estaLogado() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getBool('logado') ?? false;
}

Future<Usuario?> recuperaUsuarioLogado() async {
  var prefs = await SharedPreferences.getInstance();
  var usuarioJson = prefs.getString('usuario');

  if (usuarioJson == null) {
    return null;
  }

  return Usuario.fromJson(jsonDecode(usuarioJson));
}