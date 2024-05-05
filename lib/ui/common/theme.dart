import 'package:flutter/material.dart';

final class AppColors {
  static const Color black = Color(0xFF0C0C0C);
  static const Color grey1 = Color(0xFF1D1E20);
  static const Color grey2 = Color(0xFF242529);
  static const Color grey3 = Color(0xFF282828);
  static const Color grey4 = Color(0xFF3E3F43);
  static const Color grey5 = Color(0xFF5E5F61);
  static const Color grey6 = Color(0xFF9F9F9F);
  static const Color grey7 = Color(0xFFDBDBDB);

  static const Color white = Color(0xFFFFFFFF);

  static const Color blue = Color(0xFF4C95FE);
  static const Color darkBlue = Color(0xFF00427D);
  static const Color green = Color(0xFF4CB24E);
  static const Color darkGreen = Color(0xFF015905);
  static const Color red = Color(0xFFFF0000);
  static const Color orange = Color(0xFFF36E36);
}

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.white,
);

final theme = ThemeData(
  fontFamily: 'SF-Pro-Display',
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: AppColors.black,
  dividerColor: AppColors.grey5,
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.zero,
    isCollapsed: true,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color(0xFF2F3035)),
      iconColor: MaterialStatePropertyAll(AppColors.grey5),
      // foregroundColor: MaterialStatePropertyAll(Colors.transparent),
      // overlayColor: MaterialStatePropertyAll(Colors.transparent),
      surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
      // shadowColor: MaterialStatePropertyAll(Colors.transparent),
    ),
  ),
);
