import 'package:auth/features/registration_page/widgets/buttonSignUp.dart';
import 'package:auth/features/registration_page/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({super.key});

  @override
  State<RegistrationPageScreen> createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  String? _username;
  String? _password;
  Future<void> _saveLoginCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(username, password);
  }

  Future<void> _login() async {
    final username = _username;
    final password = _password;
    final prefs = await SharedPreferences.getInstance();
    // Проверка уникальности логина (здесь можно добавить свою логику)
    //final savedUsername = await _getSavedUsername();
    if (prefs.containsKey(username!)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ошибка'),
          content: Text('Пользователь с таким логином уже существует.'),
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

    // Сохранение данных
    await _saveLoginCredentials(username, password!);

    // Переход на следующий экран (например, домашний экран)
    Navigator.pop(context);
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
                    _username = word, //сделать проверку на свободность логина
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
              Center(
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
                        _login();
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
