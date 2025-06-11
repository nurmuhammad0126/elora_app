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
  Color get grey50 => Colors.grey.shade50;
  Color get grey100 => Colors.grey.shade100;
  Color get grey200 => Colors.grey.shade200;
  Color get grey300 => Colors.grey.shade300;
  Color get grey400 => Colors.grey.shade400;
  Color get grey500 => Colors.grey.shade500;
  Color get grey600 => Colors.grey.shade600;

  Color get background => const Color(0xFFF5F5F5);
  Color get surface => Colors.white;
  Color get error => const Color.fromARGB(255, 255, 0, 0);
  Color get success => const Color(0xFF43A047);
  Color get black => Colors.black;
  Color get white => Colors.white;
  Color get disabled => const Color(0xFFE0E0E0);
  Color get border => const Color(0xFFEEEEEE);
}
