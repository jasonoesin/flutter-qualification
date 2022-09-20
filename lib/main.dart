import 'package:flutter/material.dart';
import 'package:qualif/login.dart';
import 'package:qualif/market.dart';

void main(List<String> args) {
  runApp(const KicksAvenue());
}

const Map<int, Color> colorBlack = {
  50: Color.fromARGB(0, 0, 0, 0),
  100: Color.fromARGB(0, 0, 0, 0),
  200: Color.fromARGB(0, 0, 0, 0),
  300: Color.fromARGB(0, 0, 0, 0),
  400: Color.fromARGB(0, 0, 0, 0),
  500: Color.fromARGB(0, 0, 0, 0),
  600: Color.fromARGB(0, 0, 0, 0),
  700: Color.fromARGB(0, 0, 0, 0),
  800: Color.fromARGB(0, 0, 0, 0),
  900: Color.fromARGB(0, 0, 0, 0),
};

class KicksAvenue extends StatelessWidget {
  const KicksAvenue({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KicksAvenue",
      home: const MarketPage(),
      theme:
          ThemeData(primarySwatch: const MaterialColor(0xFF000000, colorBlack)),
    );
  }
}
