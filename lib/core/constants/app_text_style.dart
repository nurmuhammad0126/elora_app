import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  static TextStyle _style(
    double size,
    FontWeight weight, [
    Color color = Colors.black
  ]) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: 'AtypText',
      color: color,
    );
  }

  final TextStyle s10w400, s10w500, s10w600;
  final TextStyle s12w400, s12w500, s12w600;
  final TextStyle s14w400, s14w500, s14w600;
  final TextStyle s16w400, s16w500, s16w600;
  final TextStyle s18w400, s18w500, s18w600;
  final TextStyle s20w400, s20w500, s20w600;
  final TextStyle s24w400, s24w500, s24w600;

  const AppTextStyles({
    // Size 10
    required this.s10w400,
    required this.s10w500,
    required this.s10w600,
    // Size 12
    required this.s12w400,
    required this.s12w500,
    required this.s12w600,
    // Size 14
    required this.s14w400,
    required this.s14w500,
    required this.s14w600,
    // Size 16
    required this.s16w400,
    required this.s16w500,
    required this.s16w600,
    // Size 18
    required this.s18w400,
    required this.s18w500,
    required this.s18w600,
    // Size 20
    required this.s20w400,
    required this.s20w500,
    required this.s20w600,
    // Size 24
    required this.s24w400,
    required this.s24w500,
    required this.s24w600,
  });

  @override
  AppTextStyles copyWith({
    TextStyle? s10w400,
    TextStyle? s10w500,
    TextStyle? s10w600,
    TextStyle? s12w400,
    TextStyle? s12w500,
    TextStyle? s12w600,
    TextStyle? s14w400,
    TextStyle? s14w500,
    TextStyle? s14w600,
    TextStyle? s16w400,
    TextStyle? s16w500,
    TextStyle? s16w600,
    TextStyle? s18w400,
    TextStyle? s18w500,
    TextStyle? s18w600,
    TextStyle? s20w400,
    TextStyle? s20w500,
    TextStyle? s20w600,
    TextStyle? s24w400,
    TextStyle? s24w500,
    TextStyle? s24w600,
  }) {
    return AppTextStyles(
      s10w400: s10w400 ?? this.s10w400,
      s10w500: s10w500 ?? this.s10w500,
      s10w600: s10w600 ?? this.s10w600,
      s12w400: s12w400 ?? this.s12w400,
      s12w500: s12w500 ?? this.s12w500,
      s12w600: s12w600 ?? this.s12w600,
      s14w400: s14w400 ?? this.s14w400,
      s14w500: s14w500 ?? this.s14w500,
      s14w600: s14w600 ?? this.s14w600,
      s16w400: s16w400 ?? this.s16w400,
      s16w500: s16w500 ?? this.s16w500,
      s16w600: s16w600 ?? this.s16w600,
      s18w400: s18w400 ?? this.s18w400,
      s18w500: s18w500 ?? this.s18w500,
      s18w600: s18w600 ?? this.s18w600,
      s20w400: s20w400 ?? this.s20w400,
      s20w500: s20w500 ?? this.s20w500,
      s20w600: s20w600 ?? this.s20w600,
      s24w400: s24w400 ?? this.s24w400,
      s24w500: s24w500 ?? this.s24w500,
      s24w600: s24w600 ?? this.s24w600,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) => this;

  static const defaultColor = Colors.black;

  static final defaultStyle = AppTextStyles(
    s10w400: _style(10, FontWeight.w400, defaultColor),
    s10w500: _style(10, FontWeight.w500, defaultColor),
    s10w600: _style(10, FontWeight.w600, defaultColor),
    s12w400: _style(12, FontWeight.w400, defaultColor),
    s12w500: _style(12, FontWeight.w500, defaultColor),
    s12w600: _style(12, FontWeight.w600, defaultColor),
    s14w400: _style(14, FontWeight.w400, defaultColor),
    s14w500: _style(14, FontWeight.w500, defaultColor),
    s14w600: _style(14, FontWeight.w600, defaultColor),
    s16w400: _style(16, FontWeight.w400, defaultColor),
    s16w500: _style(16, FontWeight.w500, defaultColor),
    s16w600: _style(16, FontWeight.w600, defaultColor),
    s18w400: _style(18, FontWeight.w400, defaultColor),
    s18w500: _style(18, FontWeight.w500, defaultColor),
    s18w600: _style(18, FontWeight.w600, defaultColor),
    s20w400: _style(20, FontWeight.w400, defaultColor),
    s20w500: _style(20, FontWeight.w500, defaultColor),
    s20w600: _style(20, FontWeight.w600, defaultColor),
    s24w400: _style(24, FontWeight.w400, defaultColor),
    s24w500: _style(24, FontWeight.w500, defaultColor),
    s24w600: _style(24, FontWeight.w600, defaultColor),
  );
}
