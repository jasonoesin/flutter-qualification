import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset("assets/logo-white.png", width: 75),
        toolbarHeight: 75,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Image.asset("assets/home-banner.jpg"),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Username", contentPadding: EdgeInsets.all(10.0)),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Password",
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: (() {}),
                child: const Text("Log In"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
