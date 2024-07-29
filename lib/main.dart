import 'package:flutter/material.dart';
import 'package:vivoapp/screens/home.dart';
import 'package:vivoapp/screens/imagem/exemplos.dart';
import 'package:vivoapp/screens/leiaute/exemplos.dart';

void main() => runApp(const VivoApp());

class VivoApp extends StatelessWidget {
  const VivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivo App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF8533AD)),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF8533AD),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ),

      ),
      home: Home(),
    );

  }
}
