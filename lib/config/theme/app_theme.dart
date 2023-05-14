import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whiz/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: GoogleFonts.nunitoTextTheme(),
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
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    textTheme: GoogleFonts.nunitoTextTheme(),
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
  );
}
