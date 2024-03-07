import 'package:flutter/material.dart';

const labelSignIn = Text(
  'Sign In',
  style: TextStyle(
    color: Colors.grey,
    fontSize: 50,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
  ),
);

final labelSignUp = ShaderMask(
  shaderCallback: (bounds) => const LinearGradient(
    colors: [
      Color.fromARGB(255, 0, 113, 227),
      Color.fromARGB(255, 1, 169, 242),
    ],
  ).createShader(
    bounds,
  ),
  child: const Text(
    'Sign Up',
    style: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
);
