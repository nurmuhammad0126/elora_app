import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.instance.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.instance.primary,
      foregroundColor: AppColors.instance.black,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.instance.primary,
        foregroundColor: AppColors.instance.black,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFC400), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      hintStyle: TextStyle(color: Color(0xFF616161), fontSize: 14),
    ),
    iconTheme: IconThemeData(color: AppColors.instance.textPrimary),
    dividerColor: AppColors.instance.grey,
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.instance.primary,
        foregroundColor: Colors.black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1C1C1C),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFBDBDBD)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dividerColor: AppColors.instance.grey,
  );
}
