import 'package:flutter/material.dart';
import 'package:vivoapp/models/usuario.dart';

class UsuarioProvider extends ChangeNotifier {

  Usuario? usuario;


  bool get isLogado => usuario != null;

  void login(Usuario usuario) {
    this.usuario = usuario;
    notifyListeners();
  }

  void logout() {
    this.usuario = null;
    notifyListeners();
  }

}
