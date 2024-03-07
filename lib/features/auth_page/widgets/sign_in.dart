import 'package:flutter/material.dart';

final signIn = ShaderMask(
  shaderCallback: (bounds) => LinearGradient(
    colors: [
      Color.fromARGB(255, 0, 113, 227),
      Color.fromARGB(255, 1, 169, 242),
    ],
  ).createShader(
    bounds,
  ),
  child: const Text(
    'Sign In',
    style: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
);
