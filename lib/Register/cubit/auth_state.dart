abstract class AuthState {}

class AuthInitial extends AuthState{}

//SignUp
class AuthSignUpInitial extends AuthState {}

class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpError extends AuthState {
  final String message;
  AuthSignUpError({required this.message});
}

//Login
class AuthLoginInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;
  AuthLoginSuccess(this.token);
}

class AuthLoginError extends AuthState {
  final String message;
  AuthLoginError({required this.message});
}

//ResendOTP
class AuthReSendOTPInitial extends AuthState {}

class AuthReSendOTPSLoading extends AuthState {}

class AuthReSendOTPSuccess extends AuthState {}

class AuthReSendOTPError extends AuthState {
  final String message;
  AuthReSendOTPError({required this.message});
}

//Logout
class AuthLogoutInitial extends AuthState {}

class AuthLogoutLoading extends AuthState {}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutError extends AuthState {
  final String message;
  AuthLogoutError({required this.message});
}

class AuthUnauthorized extends AuthState {}
