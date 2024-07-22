import 'package:flutter/material.dart';

void main() {
  PlanoInternet plano = PlanoInternet('Vivo Fibra', 100.0, 99.99);
  plano.exibirInfo();
  plano.velocidade = 200.0;
  plano.exibirInfo();
}

class PlanoInternet {

  String _nome;
  double _velocidade;
  double _preco;

  PlanoInternet(this._nome, this._velocidade, this._preco);

  // Getters e Setters
  String get nome => _nome;
  double get preco => _preco;
  double get velocidade => _velocidade;

  set nome(String novoNome) => _nome = novoNome;
  set preco(double novoPreco) => _preco = novoPreco;
  set velocidade(double novaVelocidade) => _velocidade = novaVelocidade;

  void exibirInfo() {
    print('Plano: $_nome, Velocidade: $_velocidade Mbps, Preço: R\$${_preco}');
  }
}