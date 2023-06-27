import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamilyFallback: const ['Nunito', 'Shabnam'],
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.black,
      secondary: AppColors.primaryColor,
      onSecondary: Colors.black,
      primaryContainer: AppColors.primaryContainerColor,
      error: AppColors.errorColor,
      onError: Colors.white,
      background: AppColors.backgroundColor,
      onBackground: Colors.black,
      surface: AppColors.backgroundColor,
      onSurface: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(56),
        backgroundColor: AppColors.primaryColor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(46),
        ),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    fontFamilyFallback: const ['Nunito', 'Shabnam'],
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,
      primaryContainer: AppColors.primaryContainerDarkColor,
      error: AppColors.errorColor,
      onError: Colors.white,
      background: AppColors.backgroundDarkColor,
      onBackground: Colors.white,
      surface: AppColors.backgroundDarkColor,
      onSurface: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(56),
        backgroundColor: AppColors.primaryColor,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(46),
        ),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
