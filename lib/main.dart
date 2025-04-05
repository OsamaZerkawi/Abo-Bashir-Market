import 'package:abo_bashir_market/cache/cache_helper.dart';
import 'package:abo_bashir_market/config/routes/router.dart';
import 'package:abo_bashir_market/config/theme/app_theme.dart';
import 'package:abo_bashir_market/core/api/dio_consumer.dart';
import 'package:abo_bashir_market/core/api/end_points.dart';
import 'package:abo_bashir_market/register/cubit/auth_cubit.dart';
import 'package:abo_bashir_market/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:abo_bashir_market/services/helper/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
    return BlocProvider(
      create: (context) =>
          AuthCubit(AuthRepository(api: DioConsumer(dio: Dio()))),
      child: MaterialApp.router(
        title: 'Flutter locatliantion',

        locale: context.locale,

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        // theme: ThemeData(
        //   progressIndicatorTheme: ProgressIndicatorThemeData(
        //     color: kPrimaryColor,
        //     circularTrackColor: kHintTextColor,
        //   ),
        //   scaffoldBackgroundColor: Colors.white,
        //   textSelectionTheme: TextSelectionThemeData(
        //     cursorColor: kPrimaryColor, // Change cursor color
        //     // selectionColor: kPrimaryColor, // Change text selection color
        //     selectionHandleColor:
        //         kPrimaryColor, // Change selection handle color
        //   ),
        // ),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme, // Dark Theme
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: true,
        routerConfig: router,
        // locale: Locale('ar', 'AE'),
      ),
    );
  }
}

