import 'package:flutter/material.dart';

ShaderMask text(String text) {
  final color = text == 'Sign In'
      ? [
          const Color.fromARGB(255, 0, 113, 227),
          const Color.fromARGB(255, 1, 169, 242),
        ]
      : [Colors.grey];

  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      colors: color,
    ).createShader(
      bounds,
    ),
    child: Text(
      text + 'fd',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
