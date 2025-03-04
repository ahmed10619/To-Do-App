import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/colors.dart';

ThemeData getDefultThemes() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
          color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16,
      ),
      fillColor: AppColors.lightGrey,
      filled: true,
    ),
  );
}

ThemeData getLightThemes() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
          color: AppColors.background,
          fontSize: 32,
          fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.lato(
        color: AppColors.background,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: GoogleFonts.lato(
        color: AppColors.background,
        fontSize: 16,
      ),
      fillColor: AppColors.lightGrey,
      filled: true,
    ),
  );
}
