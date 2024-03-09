import 'package:flutter/material.dart';

Container bottonSignIn(BuildContext context, GlobalKey<FormState> keyForm) {
  return Container(
    child: ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 113, 227),
          Color.fromARGB(255, 151, 215, 243),
        ],
      ).createShader(
        bounds,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.only(top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 25,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: Colors.black,
              ),
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  Navigator.pushNamed(context, '/page');
                }
              },
              child: const Text(
                "Sign In",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
