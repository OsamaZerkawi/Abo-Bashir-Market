import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/config/theme/app_theme.dart';
import 'package:abo_bashir_market/core/databases/api/dio_consumer.dart';
import 'package:abo_bashir_market/core/databases/cache/cache_helper.dart';
import 'package:abo_bashir_market/features/product/domain/repository/product_repository.dart';
import 'package:abo_bashir_market/features/product/presentation/cubit/product_cubit.dart';
import 'package:abo_bashir_market/features/register/presentation/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/features/register/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:abo_bashir_market/services/helper/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/lang', // Path to translations
      fallbackLocale: Locale('en'), // Default language
      saveLocale: true,
      child: const ShoeStoreApp()));
}

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => AuthCubit(
        //     AuthRepository(
        //       api: DioConsumer(dio: Dio()),
        //     ),
        //   ),
        //   child: MaterialApp.router(
        //     title: 'Flutter locatliantion',
        //     locale: context.locale,
        //     localizationsDelegates: context.localizationDelegates,
        //     supportedLocales: context.supportedLocales,
        //     theme: AppTheme.lightTheme,
        //     darkTheme: AppTheme.darkTheme, // Dark Theme
        //     themeMode: ThemeMode.light,
        //     debugShowCheckedModeBanner: true,
        //     routerConfig: router,
        //     // locale: Locale('ar', 'AE'),
        //   ),
        // );
        MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepository(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            ProductRepository(
              api: DioConsumer(
                dio: Dio(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter locatliantion',
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme, // Dark Theme
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: true,
        routerConfig: router,
        // locale: Locale('ar', 'AE'),
      ),
    );
  }
}
