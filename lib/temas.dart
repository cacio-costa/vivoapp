import 'package:flutter/material.dart';

ThemeData TEMA_CLARO = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF8533AD)),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    // style for ListTile title
    titleMedium: TextStyle(fontSize: 16, color: Colors.black87),
    titleSmall: TextStyle(fontSize: 12, color: Colors.black45),
  ),
  appBarTheme: const AppBarTheme(
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
);
