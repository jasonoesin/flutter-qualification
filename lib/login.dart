import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualif/home.dart';
import 'package:qualif/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isAgree = false;

  var userError = "";
  var passError = "";

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.widgetBgColor(),
          title: Image.asset("assets/logo-white.png", width: 75),
          toolbarHeight: 75,
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).swapTheme();
              },
              icon: Icon(themeProvider.appBarIcon()),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Image.asset("assets/home-banner.jpg"),
              TextField(
                style: TextStyle(color: themeProvider.widgetColor()),
                controller: usernameController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: themeProvider.widgetColor())),
                  hintStyle: TextStyle(color: themeProvider.widgetColor()),
                  hintText: "Username",
                  contentPadding: const EdgeInsets.all(10.0),
                  errorText: userError != "" ? userError : null,
                ),
              ),
              TextField(
                style: TextStyle(color: themeProvider.widgetColor()),
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: themeProvider.widgetColor())),
                    hintStyle: TextStyle(color: themeProvider.widgetColor()),
                    hintText: "Password",
                    contentPadding: const EdgeInsets.all(10.0),
                    errorText: passError != "" ? passError : null),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: (() {
                      setState(() {
                        userError = "";
                        passError = "";
                      });

                      if (usernameController.text.isEmpty) {
                        setState(() {
                          userError = "Username field must be filled";
                        });
                        return;
                      }
                      if (passwordController.text.length < 5) {
                        setState(() {
                          passError =
                              "Password length must be at least 5 characters";
                        });
                        return;
                      }
                      if (usernameController.text.contains(' ')) {
                        userError = "Username field can't contain any spaces";
                        return;
                      }
                      if (passwordController.text.contains(' ')) {
                        passError = "Password field can't contain any spaces";
                        return;
                      }

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage(username: usernameController.text);
                        },
                      ), (route) => false);
                    }),
                    child: const Text("Log In"),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
