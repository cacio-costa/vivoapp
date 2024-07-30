import 'package:ulid/ulid.dart';

class Chamado {

  final String id;
  final String userId;
  final String titulo;
  final DateTime dataDeAbertura;
  final String descricao;

  DateTime? dataDeFechamento;

  Chamado({
    required this.userId,
    required this.titulo,
    required this.dataDeAbertura,
    required this.descricao,
  }) : id = Ulid().toString();

  bool get fechado => dataDeFechamento != null && dataDeFechamento!.isBefore(DateTime.now());

  @override
  String toString() {
    return 'Chamado{userId: $userId, titulo: $titulo, dataDeAbertura: $dataDeAbertura, descricao: $descricao, dataDeFechamento: $dataDeFechamento}';
  }

  Chamado.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        titulo = json['titulo'],
        dataDeAbertura = DateTime.parse(json['dataDeAbertura']),
        descricao = json['descricao'],
        dataDeFechamento = json['dataDeFechamento'] != null
            ? DateTime.parse(json['dataDeFechamento'])
            : null;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'titulo': titulo,
      'dataDeAbertura': dataDeAbertura.toIso8601String(),
      'descricao': descricao,
      'dataDeFechamento': dataDeFechamento?.toIso8601String(),
    };
  }
}