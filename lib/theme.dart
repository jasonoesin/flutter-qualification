import 'package:flutter/material.dart';

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

const Map<int, Color> colorWhite = {
  50: Color.fromARGB(0, 255, 255, 255),
  100: Color.fromARGB(0, 255, 255, 255),
  200: Color.fromARGB(0, 255, 255, 255),
  300: Color.fromARGB(0, 255, 255, 255),
  400: Color.fromARGB(0, 255, 255, 255),
  500: Color.fromARGB(0, 255, 255, 255),
  600: Color.fromARGB(0, 255, 255, 255),
  700: Color.fromARGB(0, 255, 255, 255),
  800: Color.fromARGB(0, 255, 255, 255),
  900: Color.fromARGB(0, 255, 255, 255),
};

class ThemeProvider extends ChangeNotifier {
  late ThemeData selectedTheme;

  ThemeProvider({required bool dark}) {
    selectedTheme = dark ? MyThemes.darkTheme : MyThemes.lightTheme;
  }

  ThemeData get getTheme => selectedTheme;

  bool get isDark => selectedTheme == MyThemes.darkTheme ? true : false;

  Color widgetBgColor() {
    return isDark ? Colors.black : Colors.grey.shade600;
  }

  Color widgetColor() {
    return isDark ? Colors.black : Colors.white;
  }

  IconData appBarIcon() {
    return isDark ? Icons.light_mode : Icons.dark_mode;
  }

  void swapTheme() {
    selectedTheme = isDark ? MyThemes.lightTheme : MyThemes.darkTheme;
    notifyListeners();
  }
}

class MyThemes {
  static ThemeData darkTheme = ThemeData(
      primarySwatch: const MaterialColor(0xFF000000, colorBlack),
      scaffoldBackgroundColor: Colors.white);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: const MaterialColor(0xFFFFFFFF, colorWhite),
    scaffoldBackgroundColor: Colors.black,
  );
}
