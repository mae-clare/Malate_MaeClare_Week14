import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const Week14App());
}

class Week14App extends StatelessWidget {
  const Week14App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social UI',
      theme: AppTheme.lightTheme,
      // Preview one screen at a time by changing HomeScreen() to ProfileScreen().
      home: const HomeScreen(),
    );
  }
}
