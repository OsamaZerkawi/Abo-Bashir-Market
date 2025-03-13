part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String token; // Token or user info can be stored here
  AuthSuccessState(this.token);
}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

class AuthLogoutState extends AuthState {}
