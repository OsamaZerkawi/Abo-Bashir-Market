import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/constants/router.dart';
import 'package:abo_bashir_market/register/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoeStoreApp());
}

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kPrimaryColor, // Change cursor color
          // selectionColor: kPrimaryColor, // Change text selection color
          selectionHandleColor: kPrimaryColor, // Change selection handle color
        ),
      ),
      debugShowCheckedModeBanner: true,
      // home: HomePage(),
      routerConfig: router,
      locale: Locale('ar', 'AE'),
      localizationsDelegates: [
        // Add localization delegates if needed
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
