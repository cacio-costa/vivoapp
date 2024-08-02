import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vivoapp/providers/usuario_provider.dart';
import 'package:vivoapp/screens/boas_praticas/provider.dart';
import 'package:vivoapp/screens/home.dart';
import 'package:vivoapp/screens/login/formulario.dart';
import 'package:vivoapp/temas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const VivoApp());
  // runApp(ExemploWidgetsSeparados());
  // runApp(const ExemploProvider());
}

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UsuarioProvider()..carregaDados()),
      ],
      child: MaterialApp(
          title: 'Vivo App',
          theme: TEMA_CLARO,
          debugShowCheckedModeBanner: false,
          home: Consumer<UsuarioProvider>(
            builder: (context, usuarioProvider, child) {
              debugPrint(usuarioProvider.usuario.toString());
              if (usuarioProvider.isLogado) {
                return const Home();
              } else {
                return const FormularioDeLogin();
              }
            },
          ),
      ),
    );
  }
}
