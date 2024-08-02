import 'package:flutter/material.dart';
import 'package:vivoapp/screens/fatura/central.dart';
import 'package:vivoapp/screens/suporte/lista_chamados.dart';
import 'package:vivoapp/widgets/botoes.dart';

class AcessoRapido extends StatelessWidget {
  const AcessoRapido({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Acesso rápido', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BotaoCard.grande(
                    icone: Icons.accessibility_new_rounded,
                    rotulo: 'Você está na categoria Platinum',
                    subtitulo: 'Conheça todos os benefícios',
                    onclick: () {},
                  ),
                  BotaoCard.pequeno(
                    icone: Icons.subject_sharp,
                    rotulo: 'Trocar assinatura',
                    onclick: () {},
                  ),
                  BotaoCard.pequeno(
                    icone: Icons.tips_and_updates_outlined,
                    rotulo: 'Conhecer o novo app',
                    onclick: () {},
                  ),
                  BotaoCard.grande(
                      icone: Icons.settings,
                      rotulo: 'Suporte técnico',
                      onclick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ListaDeChamados()),
                        );
                      }),
                ],
              ),
              Row(
                children: [
                  BotaoCard.pequeno(
                      icone: Icons.monetization_on_outlined,
                      rotulo: 'Central de faturas',
                      onclick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const CentralDeFaturas()),
                        );
                      }),
                  BotaoCard.pequeno(
                    icone: Icons.support_agent,
                    rotulo: 'Atendimento exclusivo',
                    onclick: () {},
                  ),
                  BotaoCard.grande(
                    icone: Icons.auto_awesome_outlined,
                    rotulo: 'Aura',
                    onclick: () {},
                  ),
                  BotaoCard.grande(
                    icone: Icons.more,
                    rotulo: 'Mais',
                    onclick: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
