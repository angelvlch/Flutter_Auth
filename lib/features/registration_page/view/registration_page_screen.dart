import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgets.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({super.key});

  @override
  State<RegistrationPageScreen> createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  String? _username;
  String? _password;
  final _formKey = GlobalKey<FormState>();
  Future<void> _saveLoginCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(username, password);
  }

  Future<void> _checkData() async {
    final username = _username;
    final password = _password;
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(username!)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('User with the same login already exists'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Data accepted"),
        backgroundColor: Colors.green[400],
      ),
    );

    await _saveLoginCredentials(username, password!);

    Navigator.pushReplacementNamed(context, '/');
  }

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

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      elevation: 25,
      backgroundColor: Color.fromRGBO(14, 183, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: Colors.black,
    );
  }

  dynamic _checkVerifyPassword(String? value) {
    if (value!.isEmpty) {
      return "Enter your password!+";
    }
    if (value != _password) {
      return "Password mismatch!";
    }
  }

  dynamic _checkLogin(String? value) {
    if (value!.isEmpty) {
      return "Enter your login!";
    }
    String p = "^[A-Za-z0-9]+\$";

    RegExp s = RegExp(p);
    if (!s.hasMatch(value)) {
      return "The login must contain only A-Z,a-z,0-9";
    }
    if (value.length > 10 || value.length < 6) {
      return "The login must contain from 6 to 10 characters!";
    }
  }

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
                onChanged: (word) => _username = word,
                validator: (value) => _checkLogin(value),
                maxLines: 1,
                decoration: textFieldDecoration("Login"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              TextFormField(
                obscureText: true,
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
                obscureText: true,
                validator: (value) => _checkVerifyPassword(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 1,
                decoration: textFieldDecoration("Verify password"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 40,
                ),
              ),
              Center(
                child: Container(
                  width: 300,
                  child: ElevatedButton(
                    style: _buttonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _checkData();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
