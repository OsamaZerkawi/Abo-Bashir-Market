
import 'package:abo_bashir_market/constants/constants.dart';
import 'package:abo_bashir_market/register/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoeStoreApp());
}

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kPrimaryColor, // Change cursor color
          // selectionColor: kPrimaryColor, // Change text selection color
          selectionHandleColor: kPrimaryColor, // Change selection handle color
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
