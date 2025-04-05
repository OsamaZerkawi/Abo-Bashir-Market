import 'package:abo_bashir_market/archive/HomeScreen.dart';
import 'package:abo_bashir_market/cache/cache_helper.dart';
import 'package:abo_bashir_market/core/api/end_points.dart';
import 'package:abo_bashir_market/register/ForgetPassowrd/foreget_password_screen.dart';
import 'package:abo_bashir_market/register/login/login_screen.dart';
import 'package:abo_bashir_market/register/signup/email_verify_screen.dart';
import 'package:abo_bashir_market/register/signup/signup_screen.dart';
import 'package:abo_bashir_market/register/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final String welcomeScreenID = '/';
final String homeScreenID = '/homeScreen';
final String loginScreenID = '/logIn';
final String signUpScreenID = '/signUp';
final String emailVerifyScreenID = '/emailVerifyScreen';
final String forgetPasswordScreenID = '/forgetPasswordScreen';

final GoRouter router = GoRouter(
    navigatorKey: GlobalKey<
        NavigatorState>(), // AGoRouter sometimes requires a navigatorKey to avoid issues with navigation.
    initialLocation: isLoggedIn() ? homeScreenID : welcomeScreenID,
    routes: [
      GoRoute(
          path: welcomeScreenID, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: homeScreenID, builder: (context, state) => HomeScreen()),
      GoRoute(path: loginScreenID, builder: (context, state) => LoginScreen()),
      GoRoute(
          path: signUpScreenID,
          builder: (context, state) {
            return SignupScreen();
          }),
      GoRoute(
          path: forgetPasswordScreenID,
          builder: (context, state) => ForgetPasswordScreen()),
      GoRoute(
          path: '$emailVerifyScreenID/:email',
          builder: (context, state) {
            final email = state.pathParameters['email'];
            return EmailVerifyScreen(email: email!);
          }),
    ]);

bool isLoggedIn() {
  final token = CacheHelper().getData(key: ApiKey.token);
  if (token == null) return false;

  // Optional: Verify token hasn't expired
  return !JwtDecoder.isExpired(token);

  // final decoded = JwtDecoder.decode(token);
  // final expiryDate = DateTime.fromMillisecondsSinceEpoch(decoded['exp'] * 1000);
  // return expiryDate.isAfter(DateTime.now());
}
