import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      primary: Color(0xFF6200EE),
      onPrimary: Colors.white,
      secondary: Color(0xFF03DAC6),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    );
  }

  TextTheme get _textTheme {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, letterSpacing: 0.25, fontFamily: 'Roboto'),
      displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.0, fontFamily: 'Roboto'),
      displaySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.0, fontFamily: 'Roboto'),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.0, fontFamily: 'Roboto'),
      headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.0, fontFamily: 'Roboto'),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15, fontFamily: 'Roboto'),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.1, fontFamily: 'Roboto'),
      titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.05, fontFamily: 'Roboto'),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, fontFamily: 'Roboto'),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, fontFamily: 'Roboto'),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.15, fontFamily: 'Roboto'),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15, fontFamily: 'Roboto'),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.1, fontFamily: 'Roboto'),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );
  }
}