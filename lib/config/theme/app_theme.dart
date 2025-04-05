import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

/// in your widgets, use Theme.of(context) to get the current theme.

/// ✅ Centralized Theme Configuration with Light & Dark Modes
class AppTheme {
  /// 🎨 Light Mode Colors
  static final lightColors = _AppColors(
    primary: const Color(0xff5BE15F),
    background: Colors.white,
    text: Colors.black,
    hintText: Colors.grey,
    card: Colors.grey[100]!,
    border: Colors.grey[300]!,
    button: const Color(0xff5BE15F),
  );

  /// 🌙 Dark Mode Colors
  static final darkColors = _AppColors(
    primary: const Color(0xff5BE15F),
    background: const Color(0xFF121212),
    text: Colors.white,
    hintText: Colors.grey[400]!,
    card: Colors.grey[900]!,
    border: Colors.grey[700]!,
    button: const Color(0xff5BE15F),
  );

  /// 📏 Common Spacing
  static double paddingSmall = 8.w;
  static double paddingMedium = 16.w;
  static double paddingLarge = 24.w;

  /// 🔲 Common Border Radius
  static double borderRadiusSmall = 8.r;
  static double borderRadiusMedium = 12.r;
  static double borderRadiusLarge = 20.r;

  /// 🔤 Text Styles (Dynamic Based on Theme)
  static TextStyle heading(BuildContext context) => TextStyle(
        fontSize: 24.sp, 
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );

  static TextStyle subtitle(BuildContext context) => TextStyle(
      fontSize: 16.sp,
      color: Theme.of(context)
          .colorScheme
          .onSurface
          .withAlpha((0.7 * 255).toInt()));

  static TextStyle body(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle buttonText(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary,
      );

  static TextStyle hint(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context)
            .colorScheme
            .onSurface
            .withAlpha((0.5 * 255).toInt()),
      );

  /// 🎨 Light & Dark Mode Themes
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightColors.primary,
    scaffoldBackgroundColor: lightColors.background,
    cardColor: lightColors.card,
    colorScheme: ColorScheme.light(
      primary: lightColors.primary,
      surface: lightColors.background,
      onPrimary: Colors.white,
      onSurface: lightColors.hintText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: lightColors.text,
        backgroundColor: lightColors.button,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkColors.primary,
    scaffoldBackgroundColor: darkColors.background,
    cardColor: darkColors.card,
    colorScheme: ColorScheme.dark(
      primary: darkColors.primary,
      surface: darkColors.background,
      onPrimary: Colors.white,
      onSurface: darkColors.hintText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: darkColors.text,
        backgroundColor: darkColors.button,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(borderRadiusMedium),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

/// 🎨 Helper Class for Colors (Light & Dark Modes)
class _AppColors {
  final Color primary;
  final Color background;
  final Color text;
  final Color hintText;
  final Color card;
  final Color border;
  final Color button;

  const _AppColors({
    required this.primary,
    required this.background,
    required this.text,
    required this.hintText,
    required this.card,
    required this.border,
    required this.button,
  });
}
