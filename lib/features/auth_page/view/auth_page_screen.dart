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
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 113, 227),
                        Color.fromARGB(255, 1, 169, 242),
                      ],
                    ).createShader(
                      bounds,
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: const Text(
                    'Sign Up',
                    style: const TextStyle(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onTap: () {},
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Login',
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
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onTap: () {},
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),

                    // gapPadding: 4,
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 113, 227),
                        Color.fromARGB(255, 1, 169, 242),
                      ],
                    ).createShader(
                      bounds,
                    ),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                )),
            Container(
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
                        onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
