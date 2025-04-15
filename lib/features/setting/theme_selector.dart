// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:abo_bashir_market/core/bloc/theme_cubit.dart';

// class ThemeSelector extends StatelessWidget {
//   const ThemeSelector({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeMode = context.watch<ThemeCubit>().state;

//     return Column(
//       children: [
//         RadioListTile<ThemeMode>(
//           title: Text('System Default'.tr()),
//           value: ThemeMode.system,
//           groupValue: themeMode,
//           onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
//         ),
//         RadioListTile<ThemeMode>(
//           title: Text('Light Mode'.tr()),
//           value: ThemeMode.light,
//           groupValue: themeMode,
//           onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
//         ),
//         RadioListTile<ThemeMode>(
//           title: Text('Dark Mode'.tr()),
//           value: ThemeMode.dark,
//           groupValue: themeMode,
//           onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
//         ),
//       ],
//     );
//   }
// }



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abo_bashir_market/features/setting/cubit/theme_cubit.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    return Column(
      children: [
        RadioListTile<ThemeMode>(
          title: Text('System Default'.tr()),
          value: ThemeMode.system,
          groupValue: themeMode,
          onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
        ),
        RadioListTile<ThemeMode>(
          title: Text('Light Mode'.tr()),
          value: ThemeMode.light,
          groupValue: themeMode,
          onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
        ),
        RadioListTile<ThemeMode>(
          title: Text('Dark Mode'.tr()),
          value: ThemeMode.dark,
          groupValue: themeMode,
          onChanged: (mode) => context.read<ThemeCubit>().setTheme(mode!),
        ),
      ],
    );
  }
}
