abstract class AuthState {}

class AuthInitial extends AuthState {}

//! ---------------- Sign Up ----------------
class AuthSignUpInitial extends AuthState {}

class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {
  final String message;
  AuthSignUpSuccess({required this.message});
}

class AuthSignUpError extends AuthState {
  final String message;
  final int statusCode;
  final bool successful;
  final dynamic data;

  AuthSignUpError({
    required this.message,
    required this.statusCode,
    required this.successful,
    required this.data,
  });
}

//! ---------------- Email Verification ----------------
class AuthEmailVerifyInitial extends AuthState {}

class AuthEmailVerifyLoading extends AuthState {}

class AuthEmailVerifySuccess extends AuthState {
  final String message;
  AuthEmailVerifySuccess({required this.message});
}

class AuthEmailVerifyError extends AuthState {
  final String message;
  final dynamic data;
  AuthEmailVerifyError({required this.message, this.data});
}

//! ---------------- Login ----------------
class AuthLoginInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;
  AuthLoginSuccess({required this.token});
}

class AuthLoginError extends AuthState {
  final String message;
  final dynamic data;
  AuthLoginError({required this.message, this.data});
}

//! ---------------- Enter OTP ----------------
class AuthEnterOTPInitial extends AuthState {}

class AuthEnterOTPLoading extends AuthState {}

class AuthEnterOTPSuccess extends AuthState {}

class AuthEnterOTPError extends AuthState {}

//! ---------------- Logout ----------------
class AuthLogoutInitial extends AuthState {}

class AuthLogoutLoading extends AuthState {}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutError extends AuthState {
  final String message;
  AuthLogoutError({required this.message});
}

//! ---------------- Profile ----------------
class AuthProfileInitial extends AuthState {}

class AuthProfileLoading extends AuthState {}

class AuthProfileSuccess extends AuthState {
  final String message;
  final dynamic data;
  AuthProfileSuccess({required this.message, this.data});
}

class AuthProfileError extends AuthState {
  final String message;
  final dynamic data;
  AuthProfileError({required this.message, this.data});
}

//! ---------------- Update Profile ----------------
class AuthUpdateInitial extends AuthState {}

class AuthUpdateLoading extends AuthState {}

class AuthUpdateSuccess extends AuthState {
  final String message;
  final dynamic data;
  AuthUpdateSuccess({required this.message, this.data});
}

class AuthUpdateError extends AuthState {
  final String message;
  final dynamic data;
  AuthUpdateError({required this.message, this.data});
}

//! ---------------- Forget Password ----------------
class AuthForgetPasswordInitial extends AuthState {}

class AuthForgetPasswordLoading extends AuthState {}

class AuthForgetPasswordSuccess extends AuthState {
  final String message;
  AuthForgetPasswordSuccess({required this.message});
}

class AuthForgetPasswordError extends AuthState {
  final String message;
  final dynamic data;
  AuthForgetPasswordError({required this.message, this.data});
}

//! ---------------- Reset Password ----------------
class AuthResetPasswordInitial extends AuthState {}

class AuthResetPasswordLoading extends AuthState {}

class AuthResetPasswordSuccess extends AuthState {
  final String message;
  AuthResetPasswordSuccess({required this.message});
}

class AuthResetPasswordError extends AuthState {
  final String message;
  final dynamic data;
  AuthResetPasswordError({required this.message, this.data});
}

//! ---------------- Resend OTP ----------------
class AuthResendOTPInitial extends AuthState {}

class AuthResendOTPLoading extends AuthState {}

class AuthResendOTPSuccess extends AuthState {}

class AuthResendOTPError extends AuthState {
  final String message;
  AuthResendOTPError({required this.message});
}

//! ---------------- Delete Account ----------------
class AuthDeleteInitial extends AuthState {}

class AuthDeleteLoading extends AuthState {}

class AuthDeleteSuccess extends AuthState {
  final String message;
  AuthDeleteSuccess({required this.message});
}

class AuthDeleteError extends AuthState {
  final String message;
  AuthDeleteError({required this.message});
}

// ---------------- Refresh Token ----------------
class AuthRefreshTokenInitial extends AuthState {}

class AuthRefreshTokenLoading extends AuthState {}

class AuthRefreshTokenSuccess extends AuthState {
  final String message;
  final dynamic data;
  AuthRefreshTokenSuccess({required this.message, this.data});
}

class AuthRefreshTokenError extends AuthState {
  final String message;
  final dynamic data;
  AuthRefreshTokenError({required this.message, this.data});
}

// ---------------- Miscellaneous ----------------
class AuthUnauthorized extends AuthState {}
