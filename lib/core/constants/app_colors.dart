import 'package:flutter/material.dart';

class AppColors {
  // Instance fields - non-static
  const AppColors();
  
  static const AppColors _instance = AppColors();
  static AppColors get instance => _instance;
  
  // Instance ranglar
  Color get primary => const Color(0xFFFFC400);
  Color get textPrimary => const Color(0xFF231F20);
  Color get textSecondary => const Color(0xFF616161);
  Color get grey => const Color(0xFFBDBDBD);
  Color get background => const Color(0xFFF5F5F5);
  Color get surface => Colors.white;
  Color get error => const Color(0xFFD32F2F);
  Color get success => const Color(0xFF43A047);
  Color get black => Colors.black;
  Color get white => Colors.white;
  Color get disabled => const Color(0xFFE0E0E0);
  Color get border => const Color(0xFFEEEEEE);
}