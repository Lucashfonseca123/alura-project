import 'package:flutter/material.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/design_system/alura_text_themes.dart';

final mainTheme = ThemeData(
  useMaterial3: false,
  colorSchemeSeed: AluraColors.purple,
  textTheme: AluraTextThemes.blackTextTheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AluraColors.purple,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
          AluraTextThemes.blackTextTheme.displayLarge!.copyWith(
        color: Colors.white,
      )),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        AluraColors.purple,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
            AluraTextThemes.blackTextTheme.displayLarge!),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        side: MaterialStateProperty.all<BorderSide?>(
          const BorderSide(color: AluraColors.purple, width: 2),
        )),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AluraColors.mediumLightGray,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AluraColors.darkPurple),
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
    hintStyle: AluraTextThemes.blackTextTheme.displayMedium,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
  ),
);
