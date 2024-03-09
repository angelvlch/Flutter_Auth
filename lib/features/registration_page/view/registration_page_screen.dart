import 'package:auth/features/registration_page/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({super.key});

  @override
  State<RegistrationPageScreen> createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  String? _login;
  String? _password;

  InputDecoration textFieldDecoration(String text) {
    return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),

        // gapPadding: 4,
      ),
      contentPadding: EdgeInsets.only(left: 30),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelSignIn,
                    labelSignUp,
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 92),
              ),
              TextFormField(
                onChanged: (word) =>
                    _login = word, //сделать проверку на свободность логина
                validator: (value) =>
                    value!.isEmpty ? "Enter your login!" : null,
                maxLines: 1,
                decoration: textFieldDecoration("Login"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              TextFormField(
                onChanged: (word) => _password = word,
                validator: (value) =>
                    value!.isEmpty ? "Enter your password!" : null,
                maxLines: 1,
                decoration: textFieldDecoration("Password"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password!";
                  }
                  if (value != _password) {
                    return "Password mismatch";
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 1,
                decoration: textFieldDecoration("Verify password"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 40,
                ),
              ),
              buttonSignUp(_formKey, context),
            ],
          ),
        ),
      ),
    );
  }
}
