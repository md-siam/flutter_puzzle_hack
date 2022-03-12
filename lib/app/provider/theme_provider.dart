import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  toggleTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}

class MyTheme {
  //* L  I  G  H  T     T  H  E  M  E *//
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Color(0xFFE6EDF2),
      iconTheme: IconThemeData(color: Color(0xFF0C91D6), size: 25),
      titleTextStyle: TextStyle(
        color: Color(0xFF0C91D6),
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color.fromARGB(61, 71, 173, 224),
    ),
    scaffoldBackgroundColor: const Color(0xFFE6EDF2),
    primaryColor: const Color(0xFFE6EDF2), // using this for MyButton color
    shadowColor: const Color.fromARGB(
        255, 180, 193, 203), // using this for MyButton shadow1 color
    splashColor: Colors.white, // using this for MyButton shadow2 color
    iconTheme: const IconThemeData(color: Color(0xFF0C91D6)),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.black87),
      caption: TextStyle(color: Colors.blueAccent),
      subtitle1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Color(0xFF0C91D6)),
    ),
    hoverColor: const Color(0xFFE6EDF2), // using for popup menu
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.blueAccent),
    ),
  );

  //* D  A  R  K     T  H  E  M  E *//
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Color(0xFF253341),
      iconTheme: IconThemeData(color: Color(0xFFFADA74), size: 25),
      titleTextStyle: TextStyle(
        color: Color(0xFFFADA74),
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color.fromARGB(184, 250, 219, 116),
    ),
    scaffoldBackgroundColor: const Color(0xFF15202B),
    primaryColor: const Color(0xFF15202B), // using this for MyButton color
    shadowColor: Colors.black, // using this for MyButton shadow1 color
    splashColor: Colors.white12, // using this for MyButton shadow2 color
    iconTheme: const IconThemeData(color: Color(0xFFFADA74)),
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Color(0xFFFADA74)),
      caption: TextStyle(color: Color(0xFFFADA74)),
      subtitle1: TextStyle(color: Colors.white),
    ),
    dialogBackgroundColor: const Color(0xFF253341),
    cardColor: const Color(0xFF15202B),
    hoverColor: const Color.fromARGB(255, 28, 43, 59), // using for popup menu
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: const Color(0xFFFADA74)),
    ),
  );
}
