import 'package:abo_bashir_market/archive/HomeScreen.dart';
import 'package:abo_bashir_market/main.dart';
import 'package:abo_bashir_market/register/login/login_screen.dart';
import 'package:abo_bashir_market/register/signup/enter_otp_screen.dart';
import 'package:abo_bashir_market/register/signup/signup_screen.dart';
import 'package:abo_bashir_market/register/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final String welcomeScreenID = '/';
final String homeScreenID = '/homeScreen';
final String loginScreenID = '/logIn';
final String signUpScreenID = '/signUp';
final String enterOtpScreenID = '/EnterOtpScreen';

final GoRouter router = GoRouter(
    navigatorKey: GlobalKey<
        NavigatorState>(), // AGoRouter sometimes requires a navigatorKey to avoid issues with navigation.

    routes: [
      GoRoute(
          path: welcomeScreenID, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: homeScreenID, builder: (context, state) => HomeScreen()),
      GoRoute(path: loginScreenID, builder: (context, state) => LoginScreen()),
      // GoRoute(
      //     path: signUpScreenID,
      //     builder: (context, state) {
      //       return SignupScreen();
      //     }),
      // GoRoute(
      //     path: '$enterOtpScreenID/:email',
      //     builder: (context, state) {
      //       final email = state.pathParameters['email'];
      //       return EnterOtpScreen(email: email!);
      //     }),
    ]);
