class Chamado {

  final String titulo;
  final DateTime dataDeAbertura;
  final String descricao;

  DateTime? dataDeFechamento;

  Chamado({
    required this.titulo,
    required this.dataDeAbertura,
    required this.descricao,
  });

  bool get fechado => dataDeFechamento != null && dataDeFechamento!.isBefore(DateTime.now());

  @override
  String toString() {
    return 'Chamado{titulo: $titulo, dataDeAbertura: $dataDeAbertura, descricao: $descricao, dataDeFechamento: $dataDeFechamento}';
  }
}