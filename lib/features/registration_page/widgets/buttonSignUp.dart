import 'package:flutter/material.dart';

Center buttonSignUp(GlobalKey<FormState> _formKey, BuildContext context) {
  return Center(
    child: Container(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 25,
          backgroundColor: Color.fromRGBO(14, 183, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.black,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Data accepted"),
                backgroundColor: Colors.green[400],
              ),
            );
          }
        },
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
