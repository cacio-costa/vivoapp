import 'package:flutter/material.dart';

BoxDecoration boxDecorationComum({Color cor = Colors.white}) {
  return BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey[300]!),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.05),
        spreadRadius: 1,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
}