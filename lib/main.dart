import 'package:flutter/material.dart';
import 'package:qualif/login.dart';
import 'package:qualif/market.dart';

void main(List<String> args) {
  runApp(const KicksAvenue());
}

class KicksAvenue extends StatelessWidget {
  const KicksAvenue({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "KicksAvenue",
      home: MarketPage(),
    );
  }
}
