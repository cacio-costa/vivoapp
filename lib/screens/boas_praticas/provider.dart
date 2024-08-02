import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContadorProvider extends ChangeNotifier {
  int contador = 0;

  void incrementa() {
    contador++;
    notifyListeners();
  }
}

class ExemploProvider extends StatelessWidget {
  const ExemploProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ContadorProvider(),
        child: const TelaDoContador(),
      ),
    );
  }
}

class TelaDoContador extends StatelessWidget {
  const TelaDoContador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILDOU TELA...');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você clicou no botão...', style: TextStyle(fontSize: 20)),
            QuadroNegro(

              // Ao invés de monitoriar mudanças aqui, use o Consumer para
              // reconstruir somente o NumeroNaTela.
              // child: NumeroNaTela(
              //   context.watch<ContadorProvider>().contador,
              // ),

              child: Consumer<ContadorProvider>(
                builder: (context, provider, child) {
                  return NumeroNaTela(provider.contador);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ContadorProvider>().incrementa();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class QuadroNegro extends StatelessWidget {
  final Widget child;

  const QuadroNegro({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILDOU QUADRO...');

    return Container(
      color: Colors.black,
      height: 50,
      width: 50,
      child: Center(
        child: child,
      ),
    );
  }
}

class NumeroNaTela extends StatelessWidget {
  final int numero;

  const NumeroNaTela(this.numero, {super.key});

  @override
  Widget build(BuildContext context) {
    print('BUILDOU CONTADOR...');

    return Text(
      numero.toString(),
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
  }
}
