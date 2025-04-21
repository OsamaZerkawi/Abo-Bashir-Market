// import 'package:flutter/material.dart';

// class AppTheme {
//   /// 🎨 Light & Dark Mode Themes
//   static ThemeData lightTheme(BuildContext context) {
//     return ThemeData(
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 14,
//           color: darkColors.hintText,
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: Colors.grey[300]!,
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: Colors.grey[300]!,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: lightColors.primary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//       ),
//       brightness: Brightness.light,
//       primaryColor: lightColors.primary,
//       scaffoldBackgroundColor: lightColors.background,
//       cardColor: lightColors.card,
//       colorScheme: ColorScheme.light(
//         primary: lightColors.primary,
//         surface: lightColors.background,
//         onPrimary: Colors.white,
//         onSurface: lightColors.text,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: lightColors.text,
//           backgroundColor: lightColors.button,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }

//   static ThemeData darkTheme(BuildContext context) {
//     return ThemeData(
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 14,
//           color: darkColors.hintText,
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color:   Colors.grey[700]!,
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color:   Colors.grey[700]!,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: lightColors.primary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//       ),
//       brightness: Brightness.dark,
//       primaryColor: darkColors.primary,
//       scaffoldBackgroundColor: darkColors.background,
//       cardColor: darkColors.card,
//       colorScheme: ColorScheme.dark(
//         primary: darkColors.primary,
//         surface: darkColors.background,
//         onPrimary: Colors.white,
//         onSurface: darkColors.text,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: darkColors.text,
//           backgroundColor: darkColors.button,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🎨 Color Definitions
//   static final lightColors = _AppColors(
//     primary: const Color(0xff5BE15F),
//     background: Colors.white,
//     text: Colors.black,
//     hintText: Colors.grey,
//     card: Colors.grey[100]!,
//     border: Colors.grey[300]!,
//     button: const Color(0xff5BE15F),
//   );

//   static final darkColors = _AppColors(
//     primary: const Color(0xff5BE15F),
//     background: const Color(0xFF121212),
//     text: Colors.white,
//     hintText: Colors.grey[400]!,
//     card: Colors.grey[900]!,
//     border: Colors.grey[700]!,
//     button: const Color(0xff5BE15F),
//   );
// }

// class _AppColors {
//   final Color primary;
//   final Color background;
//   final Color text;
//   final Color hintText;
//   final Color card;
//   final Color border;
//   final Color button;

//   const _AppColors({
//     required this.primary,
//     required this.background,
//     required this.text,
//     required this.hintText,
//     required this.card,
//     required this.border,
//     required this.button,
//   });
// }

//! This use hard values
// import 'package:abo_bashir_market/config/size_config.dart';
// import 'package:flutter/material.dart';

// /// Centralized Theme Manager for Light & Dark Modes.
// class AppTheme {
//   /// 🎨 Returns the light theme with customized colors and components.
//   static ThemeData lightTheme(BuildContext context) {
//     return ThemeData(
//       brightness: Brightness.light,
//       primaryColor: _lightColors.primary,
//       scaffoldBackgroundColor: _lightColors.background,
//       cardColor: _lightColors.card,
//       colorScheme: ColorScheme.light(
//         primary: _lightColors.primary,
//         surface: _lightColors.background,
//         onPrimary: Colors.white,
//         onSurface: _lightColors.text,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 14,
//           color: _lightColors.hintText,
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _lightColors.border,
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _lightColors.border,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _lightColors.primary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall_8),
//           borderSide: BorderSide(
//             color: ThemeData.light().colorScheme.error,
//             width: 2,
//           ),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: _lightColors.text,
//           backgroundColor: _lightColors.button,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🌙 Returns the dark theme with customized colors and components.
//   static ThemeData darkTheme(BuildContext context) {
//     return ThemeData(
//       brightness: Brightness.dark,
//       primaryColor: _darkColors.primary,
//       scaffoldBackgroundColor: _darkColors.background,
//       cardColor: _darkColors.card,
//       colorScheme: ColorScheme.dark(
//         primary: _darkColors.primary,
//         surface: _darkColors.background,
//         onPrimary: Colors.white,
//         onSurface: _darkColors.text,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 14,
//           color: _darkColors.hintText,
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _darkColors.border,
//             width: 1,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _darkColors.border,
//             width: 1,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: _darkColors.primary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.dark().colorScheme.error,
//             width: 2,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: ThemeData.dark().colorScheme.error,
//             width: 2,
//           ),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           foregroundColor: _darkColors.text,
//           backgroundColor: _darkColors.button,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🎯 Color set for light mode.
//   static final _lightColors = _AppColors(
//     primary: const Color(0xff5BE15F),
//     background: Colors.white,
//     text: Colors.black,
//     hintText: Colors.grey[600]!,
//     card: Colors.grey[100]!,
//     border: Colors.grey[300]!,
//     button: const Color(0xff5BE15F),
//   );

//   /// 🌒 Color set for dark mode.
//   static final _darkColors = _AppColors(
//     primary: const Color(0xff5BE15F),
//     background: const Color(0xFF121212),
//     text: Colors.white,
//     hintText: Colors.grey[400]!,
//     card: Colors.grey[900]!,
//     border: Colors.grey[700]!,
//     button: const Color(0xff5BE15F),
//   );
// }

// /// 🎨 Model for defining a set of colors for a theme.
// class _AppColors {
//   final Color primary;
//   final Color background;
//   final Color text;
//   final Color hintText;
//   final Color card;
//   final Color border;
//   final Color button;

//   const _AppColors({
//     required this.primary,
//     required this.background,
//     required this.text,
//     required this.hintText,
//     required this.card,
//     required this.border,
//     required this.button,
//   });
// }

//!This use responsive values
import 'package:abo_bashir_market/core/utils/app_colors.dart';
import 'package:abo_bashir_market/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      iconTheme: IconThemeData(color: AppColors.white),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.error,
      ),
      brightness: Brightness.light,
      primaryColor: _lightColors.primary,
      scaffoldBackgroundColor: _lightColors.background,
      cardColor: _lightColors.card,
      colorScheme: ColorScheme.light(
        primary: _lightColors.primary,
        surface: _lightColors.background,
        onPrimary: Colors.white,
        onSurface: _lightColors.text,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: AppSizes.textSmall_14,
          color: _lightColors.hintText,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMedium_16,
          vertical: AppSizes.paddingMedium_16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _lightColors.border,
            width: AppSizes.dividerThickness_1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _lightColors.border,
            width: AppSizes.dividerThickness_1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _lightColors.primary,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: ThemeData.light().colorScheme.error,
            width: 2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall_8),
          borderSide: BorderSide(
            color: ThemeData.light().colorScheme.error,
            width: 2.w,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _lightColors.background,
          backgroundColor: _lightColors.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge_20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.paddingSmall_8,
            horizontal: AppSizes.paddingLarge_24,
          ),
          textStyle: TextStyle(
            fontSize: AppSizes.textMedium_16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _darkColors.primary,
      scaffoldBackgroundColor: _darkColors.background,
      cardColor: _darkColors.card,
      colorScheme: ColorScheme.dark(
        primary: _darkColors.primary,
        surface: _darkColors.background,
        onPrimary: Colors.white,
        onSurface: _darkColors.text,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: AppSizes.textSmall_12,
          color: _darkColors.hintText,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMedium_16,
          vertical: AppSizes.paddingMedium_16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _darkColors.border,
            width: AppSizes.dividerThickness_1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _darkColors.border,
            width: AppSizes.dividerThickness_1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: _darkColors.primary,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium_12),
          borderSide: BorderSide(
            color: ThemeData.dark().colorScheme.error,
            width: 2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall_8),
          borderSide: BorderSide(
            color: ThemeData.dark().colorScheme.error,
            width: 2.w,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _darkColors.background,
          backgroundColor: _darkColors.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLarge_20),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.paddingSmall_8,
            horizontal: AppSizes.paddingLarge_24,
          ),
          textStyle: TextStyle(
            fontSize: AppSizes.textMedium_16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static final _lightColors = _AppColors(
    primary: AppColors.primaryColor,
    background: Colors.white,
    text: Colors.black,
    hintText: Colors.grey[600]!,
    card: Colors.grey[100]!,
    border: Colors.grey[300]!,
    button: const Color(0xff5BE15F),
  );

  static final _darkColors = _AppColors(
    primary: AppColors.primaryColor,
    background: AppColors.darkBackground,
    text: Colors.white,
    hintText: Colors.grey[400]!,
    card: AppColors.darkCard,
    border: Colors.grey[700]!,
    button: const Color(0xff5BE15F),
  );
}

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
