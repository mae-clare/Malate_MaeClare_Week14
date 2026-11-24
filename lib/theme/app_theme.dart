import 'package:flutter/material.dart';

class AppTheme {
  static const Color ink = Color(0xFF202124);
  static const Color muted = Color(0xFF777777);
  static const Color line = Color(0xFFEAEAEA);
  static const Color accent = Color(0xFFC13584);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: ink,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: ink),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: ink),
        bodyMedium: TextStyle(fontSize: 13, color: ink),
        bodySmall: TextStyle(fontSize: 11, color: muted),
      ),
    );
  }
}
