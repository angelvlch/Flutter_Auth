import 'dart:ffi';

import 'package:auth/features/auth_page/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPageScreen extends StatefulWidget {
  const AuthPageScreen({super.key});

  @override
  State<AuthPageScreen> createState() => _AuthPageScreenState();
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  final _keyForm = GlobalKey<FormState>();
  String? _login, _password;

  Future<void> _checkData() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(_login!)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("User with this login not found"),
        ),
      );
      return;
    }
    if (prefs.getString(_login!) != _password) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Incorrect password"),
        ),
      );
      return;
    }
    Navigator.pushReplacementNamed(context, '/page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: text('Sign In'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 70)),
            Form(
              key: _keyForm,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: textField("Login"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: textField("Password")),
                  forgotPasswordLabel,
                  Center(
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 25,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) {
                            _checkData();
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
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Center(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Нет аккаунта? "),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, '/registration'),
                      child: const Text(
                        "Зарегистрироваться.",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField textField(String text) {
    return TextFormField(
      obscureText: text == 'Login' ? false : true,
      validator: (value) => value!.isEmpty ? "Enter your $text!" : null,
      onChanged: (value) =>
          text == 'Login' ? _login = value : _password = value,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.only(left: 30),
      ),
    );
  }
}
