import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivoapp/models/usuario.dart';
import 'package:vivoapp/providers/usuario_provider.dart';
import 'package:vivoapp/screens/home.dart';

void main() {

  Widget? app;
  UsuarioProvider? usuarioProvider;

  setUp(() {
    usuarioProvider = UsuarioProvider();
    SharedPreferences.setMockInitialValues({});

    app = ChangeNotifierProvider(
      create: (context) => usuarioProvider,
      child: MaterialApp(
        home: const Home(),
      ),
    );
  });

  testWidgets('Deve exibir saudação para usuário logado',
      (WidgetTester tester) async {

    await tester.pumpWidget(app!);

    await usuarioProvider!.login(Usuario(id: '1', nome: 'Fulano', email: 'fulano@email.com'));
    await tester.pump();

    expect(find.textContaining('Olá, Fulano.', findRichText: true), findsOneWidget);
  });

  testWidgets('Deve exibir saudação para usuário logado',
          (WidgetTester tester) async {

        await tester.pumpWidget(
          app!
        );

        await usuarioProvider!.login(Usuario(id: '1', nome: 'Fulano', email: 'fulano@email.com'));
        await tester.pumpAndSettle();
        
        expect(find.textContaining('Você tem prontas para pagar. Quer pagar agora?'), findsOneWidget);
        expect(find.ancestor(of: find.text('Ocultar notificação'), matching: find.byType(TextButton)), findsOneWidget);

        var btnOcultarNotificacao = find.byType(TextButton);
        await tester.tap(btnOcultarNotificacao);
        await tester.pump(Duration(milliseconds: 1000));

        expect(find.textContaining('Você tem prontas para pagar. Quer pagar agora?'), findsNothing);
      });
}
