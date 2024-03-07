import 'package:flutter/material.dart';

ShaderMask text(String text) {
  final color = [
    const Color.fromARGB(255, 0, 113, 227),
    const Color.fromARGB(255, 1, 169, 242),
  ];

  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      colors: color,
    ).createShader(
      bounds,
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
