// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:abo_bashir_market/core/bloc/theme_cubit.dart';

// class ThemeToggleButton extends StatelessWidget {
//   final double? iconSize;
//   final Color? iconColor;

//   const ThemeToggleButton({
//     super.key,
//     this.iconSize,
//     this.iconColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = context.watch<ThemeCubit>().state == ThemeMode.dark;

//     return IconButton(
//       iconSize: iconSize,
//       color: iconColor,
//       icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
//       onPressed: () => context.read<ThemeCubit>().toggleTheme(),
//       tooltip:
//           isDarkMode ? 'Switch to Light Mode'.tr() : 'Switch to Dark Mode'.tr(),
//     );
//   }
// }

import 'package:abo_bashir_market/features/setting/cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    IconData getIcon() {
      switch (themeMode) {
        case ThemeMode.light:
          return Icons.light_mode_outlined;
        case ThemeMode.dark:
          return Icons.dark_mode;
        case ThemeMode.system:
          return Icons.brightness_auto;
      }
    }

    String getTooltip() {
      switch (themeMode) {
        case ThemeMode.light:
          return 'Switch to Dark Mode'.tr();
        case ThemeMode.dark:
          return 'Switch to System Default'.tr();
        case ThemeMode.system:
          return 'Switch to Light Mode'.tr();
      }
    }

    return IconButton(
      icon: Icon(getIcon()),
      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      tooltip: getTooltip(),
    );
  }
}
