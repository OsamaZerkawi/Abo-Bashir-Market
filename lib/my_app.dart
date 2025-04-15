import 'package:abo_bashir_market/features/setting/cubit/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/router.dart';
import 'config/theme/app_theme.dart';
import 'core/databases/cache/cache_helper.dart';
import 'injection/providers.dart';

class MyApp extends StatelessWidget {
  final CacheHelper cacheHelper;

  const MyApp({super.key, required this.cacheHelper});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: buildAppProviders(cacheHelper),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Abo Bashir Market',
            debugShowCheckedModeBanner: true,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode: themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
