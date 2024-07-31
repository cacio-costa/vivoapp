import 'package:flutter/material.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/services/autenticacao.dart';

class UsuarioProvider extends ChangeNotifier {

  Usuario? usuario;


  bool get isLogado => usuario != null;

  Future<void> login(Usuario usuario) async {
    this.usuario = usuario;
    await registraLogin(usuario);
    notifyListeners();
  }

  Future<void> logout() async {
    this.usuario = null;
    await limpaLogin();
    notifyListeners();
  }

  void carregaDados() async {
    var usuarioLogado = await recuperaUsuarioLogado();
    debugPrint(usuarioLogado.toString());
    if (usuarioLogado != null) {
      login(usuarioLogado);
    }
  }

}
