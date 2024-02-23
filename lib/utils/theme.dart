import 'package:flutter/material.dart';
import 'package:story_app/res/fonts.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 157, 132, 90),
    primary: const Color.fromARGB(255, 157, 132, 90),
  ),
  fontFamily: Fonts.signikaNegative,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      backgroundColor: const Color.fromARGB(255, 1, 153, 99),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
