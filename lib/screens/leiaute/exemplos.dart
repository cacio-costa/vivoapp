import 'package:flutter/material.dart';

class ExemploRichText extends StatelessWidget {
  const ExemploRichText({super.key});

  @override
  Widget build(BuildContext context) {
    var destaque = const TextStyle(
      color: Colors.purple,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.0,
    );

    var somenteNegrito = const TextStyle(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de RichText')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: RichText(
              text: TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 0.0,
            ),
            children: [
              TextSpan(
                text: 'Acessórios para seu iPhone. Aqui na ',
              ),
              TextSpan(
                text: 'Vivo ',
                style: destaque,
              ),
              TextSpan(
                text: ' parcelamos ',
                style: somenteNegrito,
              ),
              TextSpan(
                text: 'sem juros',
                style: destaque,
              ),
              TextSpan(
                text: '  e temos  ',
                style: somenteNegrito,
              ),
              TextSpan(
                text: 'frete grátis.',
                style: destaque,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class ExemploFlexible extends StatelessWidget {
  const ExemploFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Flexible')),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ExemploExpanded extends StatelessWidget {
  const ExemploExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Flexible')),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 150,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
              height: 150,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 150,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.purple,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}

class ExemploCircleAvatar extends StatelessWidget {
  const ExemploCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de CircleAvatar')),
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundImage:
              const AssetImage('assets/images/corinthians_rebaixado.jpeg'),
        ),
      ),
    );
  }
}

class ExemploWrap extends StatelessWidget {
  const ExemploWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Wrap')),
      body: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.yellow,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.purple,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.orange,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.pink,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.teal,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.brown,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.grey,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}

class ExemploFittedBox extends StatelessWidget {
  const ExemploFittedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de FittedBox')),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.purple,
        child: FittedBox(
          child: Center(
            child: Text('Mundo Vivo',
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class ExemploVisibility extends StatefulWidget {
  const ExemploVisibility({super.key});

  @override
  State<ExemploVisibility> createState() => _ExemploVisibilityState();
}

class _ExemploVisibilityState extends State<ExemploVisibility> {
  bool visivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo de Visibility')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() => visivel = !visivel);
              },
              child: Text('Mostrar/Esconder mundial do Palmeiras'),
            ),
            Visibility(
              visible: visivel,
              child: Container(
                color: Colors.green,
                height: 300,
                width: 300,
                child: FittedBox(child: Text('Palmeiras não tem mundial')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExemploSliverAppBar extends StatelessWidget {
  const ExemploSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: Image.asset(
                'assets/images/corinthians_rebaixado.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

