const List<String> _NOME_MES = [
  'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
];

enum StatusFatura {
  aberta,
  atrasada,
  paga,
}

class Fatura {
  int? id;

  DateTime vencimento;
  double valor;

  StatusFatura status;

  Fatura({
    required this.valor,
    required this.vencimento,
    this.status = StatusFatura.aberta,
    this.id,
  });

  bool get vencida => vencimento.isBefore(DateTime.now());
  bool get paga => status == StatusFatura.paga;

  String get diaMesVencimento => '${vencimento.day}/${vencimento.month}';
  String get descricaoVencimento => vencida ? 'Venceu em $diaMesVencimento' : 'Vence em $diaMesVencimento';
  String get nomeMes =>_NOME_MES[vencimento.month - 1];

  @override
  String toString() {
    return 'Fatura{id: $id, vencimento: $vencimento, valor: $valor, status: $status}';
  }

}
