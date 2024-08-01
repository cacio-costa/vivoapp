import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExemploProvider extends StatelessWidget {
  const ExemploProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ContadorProvider(),
        child: TelaDoContador(),
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

    var numero = context.watch<ContadorProvider>().contador;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você clicou no botão...', style: TextStyle(fontSize: 20)),
            QuadroNegro(
              child: Contador(numero),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ContadorProvider>().incrementa();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Contador extends StatelessWidget {

  final int numero;

  Contador(this.numero);

  @override
  Widget build(BuildContext context) {
    print('BUILDOU CONTADOR...');

    return Text(numero.toString());
  }
}

class QuadroNegro extends StatelessWidget {
  Widget child;

  QuadroNegro({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    print('BUILDOU QUADRO...');

    return Container(
      color: Colors.black,
      height: 50,
      width: 50,
      child: Center(
        child: Text('0', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}

class ContadorProvider extends ChangeNotifier {

  int contador = 0;

  void incrementa() {
    contador++;
    notifyListeners();
  }

}
