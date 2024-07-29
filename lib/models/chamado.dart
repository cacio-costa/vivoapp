class Chamado {

  final int userId;
  final String titulo;
  final DateTime dataDeAbertura;
  final String descricao;

  DateTime? dataDeFechamento;

  Chamado({
    required this.userId,
    required this.titulo,
    required this.dataDeAbertura,
    required this.descricao,
  });

  bool get fechado => dataDeFechamento != null && dataDeFechamento!.isBefore(DateTime.now());

  @override
  String toString() {
    return 'Chamado{userId: $userId, titulo: $titulo, dataDeAbertura: $dataDeAbertura, descricao: $descricao, dataDeFechamento: $dataDeFechamento}';
  }
}