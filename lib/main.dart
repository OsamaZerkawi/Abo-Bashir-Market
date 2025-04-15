// import 'package:abo_bashir_market/config/routes/router.dart';
// import 'package:abo_bashir_market/config/theme/app_theme.dart';
// import 'package:abo_bashir_market/core/databases/api/dio_consumer.dart';
// import 'package:abo_bashir_market/core/databases/cache/cache_helper.dart';
// import 'package:abo_bashir_market/features/product/domain/repository/product_repository.dart';
// import 'package:abo_bashir_market/features/product/presentation/cubit/product_cubit.dart';
// import 'package:abo_bashir_market/features/register/domain/repository/auth_repository.dart';
// import 'package:abo_bashir_market/features/register/presentation/cubit/auth_cubit.dart';
// import 'package:abo_bashir_market/features/setting/theme_cubit.dart';
// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await ScreenUtil.ensureScreenSize();
//   final cacheHelper = CacheHelper();
//   await cacheHelper.init();
//   await EasyLocalization.ensureInitialized();

//   runApp(
//     ScreenUtilInit(
//       designSize: const Size(384, 832),
//       minTextAdapt: true,
//       splitScreenMode: false,
//       builder: (_, __) => EasyLocalization(
//         supportedLocales: const [Locale('en'), Locale('ar')],
//         path: 'assets/lang',
//         fallbackLocale: const Locale('en'),
//         saveLocale: true,
//         child: MyApp(cacheHelper: cacheHelper),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   final CacheHelper cacheHelper;

//   const MyApp({super.key, required this.cacheHelper});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => ThemeCubit(cacheHelper),
//         ),
//         BlocProvider(
//           create: (_) => AuthCubit(
//             AuthRepository(api: DioConsumer(dio: Dio())),
//           ),
//         ),
//         BlocProvider(
//           create: (_) => ProductCubit(
//             ProductRepository(api: DioConsumer(dio: Dio())),
//           ),
//         ),
//       ],
//       child: BlocBuilder<ThemeCubit, ThemeMode>(
//         builder: (context, themeMode) {
//           return MaterialApp.router(
//             title: 'Flutter Localization',
//             locale: context.locale,
//             localizationsDelegates: context.localizationDelegates,
//             supportedLocales: context.supportedLocales,
//             theme: AppTheme.lightTheme(context),
//             darkTheme: AppTheme.darkTheme(context),
//             themeMode: themeMode,
//             debugShowCheckedModeBanner: true,
//             routerConfig: router,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/databases/cache/cache_helper.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: const Size(384, 832),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, __) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        child: MyApp(cacheHelper: cacheHelper),
      ),
    ),
  );
}
