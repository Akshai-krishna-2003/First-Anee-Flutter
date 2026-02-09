import 'package:flutter/material.dart';

class AppTheme {
  static const Color sunflowerYellow = Color(0xFFFFD54F);

  static ThemeData theme = ThemeData(
    primaryColor: sunflowerYellow,
    scaffoldBackgroundColor: Color(0xFFFFFDE7),
    appBarTheme: const AppBarTheme(
      backgroundColor: sunflowerYellow,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
    ),
  );
}
