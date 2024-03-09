import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonSignUp extends StatefulWidget {
  final GlobalKey<FormState> _formKey;

  const ButtonSignUp(this._formKey, {super.key});

  @override
  State<ButtonSignUp> createState() => _ButtonSignUpState();
}

class _ButtonSignUpState extends State<ButtonSignUp> {
  String? _username, _password;
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

    // Сохранение данных
    await _saveLoginCredentials(username, password!);

    // Переход на следующий экран (например, домашний экран)
    Navigator.pop(
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            if (widget._formKey.currentState!.validate()) {
              _login();
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
}
