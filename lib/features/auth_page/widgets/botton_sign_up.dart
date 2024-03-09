import 'package:flutter/material.dart';

Center bottonSignUp(BuildContext context) {
  return Center(
    child: Container(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/registration');
        },
        style: ElevatedButton.styleFrom(
          elevation: 25,
          backgroundColor: Color.fromRGBO(14, 183, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.black,
        ),
        child: const Text(
          "Sign Up",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    ),
  );
}
