import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualif/login.dart';
import 'package:qualif/theme.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    child: const KicksAvenue(),
    create: (context) => ThemeProvider(dark: true),
  ));
}

class KicksAvenue extends StatefulWidget {
  const KicksAvenue({super.key});

  @override
  State<KicksAvenue> createState() => _KicksAvenueState();
}

class _KicksAvenueState extends State<KicksAvenue> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
          title: "KicksAvenue",
          home: const LoginPage(),
          theme: themeProvider.getTheme);
    });
  }
}
