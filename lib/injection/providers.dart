import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../core/databases/api/dio_consumer.dart';
import '../core/databases/cache/cache_helper.dart';
import '../features/register/domain/repository/auth_repository.dart';
import '../features/register/presentation/cubit/auth_cubit.dart';
import '../features/setting/cubit/theme_cubit.dart';

List<BlocProvider> buildAppProviders(CacheHelper cacheHelper) {
  final dioConsumer = DioConsumer(dio: Dio());

  return [
    BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(cacheHelper),
    ),
    BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(
        AuthRepository(api: dioConsumer),
      ),
    ),
    // BlocProvider<ProductCubit>(
    //   create: (_) => ProductCubit(
    //     ProductRepository(api: dioConsumer),
    //   ),
    // ),
  ];
}
