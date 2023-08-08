import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  static const Color _primaryColor = Color(0xFF5C83);
  static const Color _primaryColorLight = Color(0xFF8AB1);
  static const Color _primaryColorDark = Color(0xFF2961);
  static const Color _secondaryColor = Color(0x33FF57);
  static const Color _secondaryColorLight = Color(0x66FF80);
  static const Color _secondaryColorDark = Color(0x00CC44);
  static const Color _errorColor = Color(0xFF4343);
  static const Color _backgroundColor = Color(0xFAFAFA);

  ThemeData get themeData {
    return ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      primary: _primaryColor,
      primaryVariant: _primaryColorDark,
      secondary: _secondaryColor,
      secondaryVariant: _secondaryColorDark,
      error: _errorColor,
      onPrimary: _backgroundColor,
      onSecondary: Colors.white,
      onBackground: Colors.black,
      onError: Colors.white,
      background: _backgroundColor,
      surface: Colors.white,
    );
  }

  TextTheme get _textTheme {
    return TextTheme(
      headline1: TextStyle(color: _primaryColorDark, fontSize: 20.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: _secondaryColor, fontSize: 18.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: _primaryColor, fontSize: 16.0),
      bodyText2: TextStyle(color: _secondaryColor, fontSize: 14.0),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );
  }

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      color: _primaryColorDark,
      iconTheme: IconThemeData(color: _secondaryColor),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _secondaryColor,
        onPrimary: Colors.white,
        shadowColor: _secondaryColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}