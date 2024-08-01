import 'package:flutter_test/flutter_test.dart';
import 'package:vivoapp/models/fatura.dart';

void main() {

  var vencimentoFuturo = DateTime.now().add(Duration(days: 1));

  test('Fatura deve ter status ABERTA por padrão quando criada', () {
    var fatura = Fatura(valor: 100, vencimento: vencimentoFuturo);
    expect(fatura.status, StatusFatura.aberta);
  });

  test('Descrição do vencimento deve ser "Vence em DD/MM" em faturas abertas', () {
    var fatura = Fatura(valor: 100, vencimento: vencimentoFuturo);
    expect(fatura.descricaoVencimento, 'Vence em ${vencimentoFuturo.day}/${vencimentoFuturo.month}');
  });

}