import 'package:flutter/material.dart';

final forgotPasswordLabel = GestureDetector(
  onTap: () {},
  child: Container(
    alignment: Alignment.topRight,
    padding: EdgeInsets.only(right: 20, top: 10),
    child: ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 113, 227),
          Color.fromARGB(255, 1, 169, 242),
        ],
      ).createShader(
        bounds,
      ),
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    ),
  ),
);
