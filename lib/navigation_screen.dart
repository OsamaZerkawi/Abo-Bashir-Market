import 'package:abo_bashir_market/config/theme/app_theme.dart';
import 'package:abo_bashir_market/core/databases/api/dio_consumer.dart';
import 'package:abo_bashir_market/core/utils/app_colors.dart';
import 'package:abo_bashir_market/core/utils/app_sizes.dart';
import 'package:abo_bashir_market/debts_screen.dart';
import 'package:abo_bashir_market/features/product/domain/repository/product_repository.dart';
import 'package:abo_bashir_market/features/product/presentation/cubit/product_cubit.dart';
import 'package:abo_bashir_market/features/product/presentation/screens/products_screen.dart';
import 'package:abo_bashir_market/house_screen.dart';
import 'package:abo_bashir_market/profile_screen.dart';
import 'package:abo_bashir_market/receipt_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int _currentIndex = 0;
  bool get isNavigationScreen => _currentIndex == 0;

  final screens = [
    BlocProvider(
      create: (context) =>
          ProductCubit(ProductRepository(api: DioConsumer(dio: Dio()))),
      // ..getAllProducts(
      //   pageNumber: 3,
      //   items: 10,
      //   column: 'created_at',
      //   direction: ApiKey.asc,
      // ),
      child: HouseScreen(),
    ),
    ReceiptScreen(),
    ProductsScreen(),
    DebtsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final items = <Widget>[
      Icon(Icons.home, size: AppSizes.iconSizeMedium_24),
      Icon(Icons.receipt_long_rounded, size: AppSizes.iconSizeMedium_24),
      Icon(Icons.add, size: AppSizes.iconSizeMedium_24),
      Icon(Icons.payments, size: AppSizes.iconSizeMedium_24),
      Icon(Icons.person_outlined, size: AppSizes.iconSizeMedium_24),
    ];

    return Scaffold(
      appBar: isNavigationScreen
          ? AppBar(
              // title: Text('أبو بشير ماركت'.tr()),
              title: Text('Title'),
            )
          : null,
      body: screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: theme.copyWith(
          iconTheme: theme.iconTheme.copyWith(
            color: isDarkMode ? AppColors.white : AppColors.white,
          ),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          items: items,
          index: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.decelerate,
          backgroundColor: isDarkMode
              ? AppTheme.lightTheme(context).canvasColor
              : AppColors.white,
          buttonBackgroundColor: isDarkMode
              ? AppTheme.darkTheme(context).colorScheme.primary
              : AppTheme.lightTheme(context).colorScheme.primary,
          color: isDarkMode ? AppColors.darkCard : AppColors.secondPrimaryColor,
        ),
      ),
      extendBody: true,
    );
  }
}
