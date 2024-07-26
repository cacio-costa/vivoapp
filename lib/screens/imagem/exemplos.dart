import 'package:flutter/material.dart';

class ExemploDecorationImage extends StatelessWidget {
  const ExemploDecorationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de DecorationImage')),
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/produtos_apple.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Acessórios para seu iPhone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                Text(
                  'Carregue seu iPhone onde você estiver',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 0.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Parcelamento sem juros e frete grátis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}