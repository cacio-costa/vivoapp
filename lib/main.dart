import 'package:flutter/material.dart';

void main() {
  runApp(Stack(
    alignment: Alignment.center,
    children: [
      Container(
        color: Colors.deepPurple,
        height: 150,
        width: 150,
      ),
      Container(
        color: Colors.deepPurpleAccent,
        height: 120,
        width: 120,
      ),
      Container(
        color: Colors.purple,
        height: 90,
        width: 90,
        child: Center(child: Text('VIVO', textDirection: TextDirection.ltr)),
      ),
    ],
  ));
}
