abstract class AuthState {}

class AuthInitial extends AuthState {}

//! SignUp
class AuthSignUpInitial extends AuthState {}

class AuthSignUpLoading extends AuthState {}

class AuthSignUpSuccess extends AuthState {
  //message if i want
  final String message;

  AuthSignUpSuccess({required this.message});
}

class AuthSignUpError extends AuthState {
  final String message;
  final int statusCode;
  final bool successfull;
  final dynamic data;
  AuthSignUpError({
    required this.message,
    required this.statusCode,
    required this.successfull,
    required this.data,
  });
}

//! EmailVerify
class AuthEmailVerifyInitial extends AuthState {}

class AuthEmailVerifyLoading extends AuthState {}

class AuthEmailVerifySuccess extends AuthState {
  final String message;
  AuthEmailVerifySuccess({required this.message});
}

class AuthEmailVerifyError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthEmailVerifyError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

//! Login
class AuthLoginInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;
  AuthLoginSuccess({required this.token});
}

class AuthLoginError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthLoginError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

//! EnterOTP
class AuthEnterOTPInitial extends AuthState {}

class AuthEnterOTPLoading extends AuthState {}

class AuthEnterOTPSuccess extends AuthState {
  // final String token;
  // AuthLoginSuccess({required this.token});
}

class AuthEnterOTPError extends AuthState {
  // final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  // AuthEnterOTPError({
    // required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  // });
}

//! Logout
class AuthLogoutInitial extends AuthState {}

class AuthLogoutLoading extends AuthState {}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutError extends AuthState {
  final String message;
  AuthLogoutError({required this.message});
}

//! Profile
class AuthProfileInitial extends AuthState {}

class AuthProfileLoading extends AuthState {}

class AuthProfileSuccess extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthProfileSuccess({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

class AuthProfileError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthProfileError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

//! update
class AuthUpdateInitial extends AuthState {}

class AuthUpdateLoading extends AuthState {}

class AuthUpdateSuccess extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthUpdateSuccess({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

class AuthUpdateError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthUpdateError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

//! ForgetPassword
class AuthForgetPasswordInitial extends AuthState {}

class AuthForgetPasswordLoading extends AuthState {}

class AuthForgetPasswordSuccess extends AuthState {
  final String message;
  AuthForgetPasswordSuccess({required this.message});
}

class AuthForgetPasswordError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthForgetPasswordError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

//! ResetPassword
class AuthResetPasswordInitial extends AuthState {}

class AuthResetPasswordLoading extends AuthState {}

class AuthResetPasswordSuccess extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthResetPasswordSuccess({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

class AuthResetPasswordError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthResetPasswordError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

//! ResendOTP
class AuthResendOTPInitial extends AuthState {}

class AuthResendOTPLoading extends AuthState {}

class AuthResendOTPSuccess extends AuthState {}

class AuthResendOTPError extends AuthState {
  final String message;
  AuthResendOTPError({required this.message});
}

//! Delete Account
class AuthDeleteInitial extends AuthState {}

class AuthDeleteLoading extends AuthState {}

class AuthDeleteSuccess extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthDeleteSuccess({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

class AuthDeleteError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthDeleteError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

//! Refresh Token
class AuthRefreshTokenInitial extends AuthState {}

class AuthRefreshTokenLoading extends AuthState {}

class AuthRefreshTokenSuccess extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  final dynamic data;
  AuthRefreshTokenSuccess({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    this.data,
  });
}

class AuthRefreshTokenError extends AuthState {
  final String message;
  // final int statusCode;
  // final bool successfull;
  // final dynamic data;
  AuthRefreshTokenError({
    required this.message,
    // this.statusCode=1,
    // this.successfull,
    // this.data,
  });
}

//! More States
class AuthUnauthorized extends AuthState {}

// class UploadProfilePicState extends AuthState {}
