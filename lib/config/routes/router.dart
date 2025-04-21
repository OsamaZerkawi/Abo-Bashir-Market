import 'package:abo_bashir_market/navigation_screen.dart';
import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/core/databases/cache/cache_helper.dart';
import 'package:abo_bashir_market/features/register/presentation/screens/ForgetPassowrd/foreget_password_screen.dart';
import 'package:abo_bashir_market/features/register/presentation/screens/login/login_screen.dart';
import 'package:abo_bashir_market/features/register/presentation/screens/signup/email_verify_screen.dart';
import 'package:abo_bashir_market/features/register/presentation/screens/signup/signup_screen.dart';
import 'package:abo_bashir_market/features/register/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final String welcomeScreenID = '/';
final String navigationScreenID = '/navigationScreen';
final String loginScreenID = '/logIn';
final String signUpScreenID = '/signUp';
final String emailVerifyScreenID = '/emailVerifyScreen';
final String forgetPasswordScreenID = '/forgetPasswordScreen';

final GoRouter router = GoRouter(
    navigatorKey: GlobalKey<
        NavigatorState>(), // AGoRouter sometimes requires a navigatorKey to avoid issues with navigation.
    initialLocation: isLoggedIn() ? navigationScreenID : welcomeScreenID,
    routes: [
      GoRoute(
          path: welcomeScreenID, builder: (context, state) => WelcomeScreen()),
      GoRoute(
          path: navigationScreenID,
          builder: (context, state) => NavigationScreen()),
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

  // if (JwtDecoder.isExpired(token)) {
  // refresh token
  // save new token
  // return true   or return false so the user should login again
  // }
  // else return false

  // final decoded = JwtDecoder.decode(token);
  // final expiryDate = DateTime.fromMillisecondsSinceEpoch(decoded['exp'] * 1000);
  // return expiryDate.isAfter(DateTime.now());
}
