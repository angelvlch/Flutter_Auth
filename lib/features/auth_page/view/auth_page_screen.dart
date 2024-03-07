import 'package:auth/features/auth_page/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                  child: text('Sign Up'),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 70)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: textField("Login"),
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: textField("Password")),
            forgotPasswordLabel,
            bottonSignIn,
          ],
        ),
      ),
    );
  }

  TextField textField(String text) {
    return TextField(
      onTap: () {},
      maxLines: 1,
      decoration: InputDecoration(
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
      ),
    );
  }
}
