// abstract class AuthState {}

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthSuccess extends AuthState {
//   // final String token;
//   // AuthSuccess(this.token);
// }

// class AuthUnauthorized extends AuthState {}

// class AuthError extends AuthState {
//   final String message;
//   AuthError(this.message);
// }

// class AuthLogout extends AuthState {}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;
  AuthLoginSuccess(this.token);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthReSendOTPSuccess extends AuthState {}

class AuthLogout extends AuthState {}

class AuthUnauthorized extends AuthState {}
