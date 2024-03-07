import 'package:auth/features/registration_page/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationPageScreen extends StatefulWidget {
  const RegistrationPageScreen({super.key});

  @override
  State<RegistrationPageScreen> createState() => _RegistrationPageScreenState();
}

class _RegistrationPageScreenState extends State<RegistrationPageScreen> {
  String? login;
  String? firstPassword;
  String? secondPassword;
  String? password;

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        // color: Colors.green.shade200,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Colors.red,
              margin: EdgeInsets.only(top: 80),
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
            TextField(
              onChanged: (word) =>
                  login = word, //сделать проверку на свободность логина
              onTap: () {},
              maxLines: 1,
              decoration: textFieldDecoration("Login"),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 22,
              ),
            ),
            TextField(
              onChanged: (word) => firstPassword = word,
              onTap: () {},
              maxLines: 1,
              decoration: textFieldDecoration("Password"),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 22,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value != "dddd") {
                  return "Пароли жолжны совпадать";
                }
              },
              onChanged: (word) {
                secondPassword = word;
                _formKey.currentState?.validate();
              },
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
                    backgroundColor: Color.fromARGB(255, 122, 137, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    shadowColor: Colors.black,
                  ),
                  onPressed: () {},
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
    );
  }
}
