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
      appBar: AppBar(
        title: const Text("KicksAvenue"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Username"),
            ),
            CheckboxListTile(
              title: const Text("Agree on KicksAvenue terms"),
              value: isAgree,
              onChanged: (value) => {
                setState(() {
                  isAgree = value!;
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
