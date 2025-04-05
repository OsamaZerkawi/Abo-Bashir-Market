import 'package:abo_bashir_market/core/api/end_points.dart';
import 'package:abo_bashir_market/core/errors/error_model.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/repository/auth_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  // final ApiConsumer apiConsumer;
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  // uploadProfilePic(XFile image) {
  //   profilePic = image;
  //   emit(UploadProfilePicState());
  // }
  //! SignUp
  signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String appPassword,
    required String image,
  }) async {
    emit(AuthSignUpLoading());
    final response = await authRepository.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      appPassword: appPassword,
      image: image,
    );
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        final parsedError = _parseErrorMessages(errModel);

        emit(AuthSignUpError(
            message: errModel.message,
            statusCode: errModel.statusCode,
            successfull: errModel.successful,
            data: 'خطأ \n${parsedError}'));
        return null;
      },
      (signUpModel) => emit(AuthSignUpSuccess(message: signUpModel.message)),
    );
  }

  //! EmailVerify
  emailVerify({
    required String email,
    required String otp,
  }) async {
    emit(AuthEmailVerifyLoading());
    final response = await authRepository.emailVerify(email: email, otp: otp);
    response.fold((errModel) {
      // final parsedError = _parseErrorMessages(errModel);
      emit(
        AuthEmailVerifyError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
          // data: parsedError,
        ),
      );
      return null;
    }, (generalResponseModel) {
      emit(AuthEmailVerifySuccess(
        message: generalResponseModel.message,
      ));
    });
  }

  //! login
  logIn({
    required String email,
    required String password,
    required String fcmToken,
    required bool rememberMe,
  }) async {
    emit(AuthLoginLoading());
    final response = await authRepository.logIn(
        email: email,
        password: password,
        fcmToken: fcmToken,
        rememberMe: rememberMe);
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        final parsedError = _parseErrorMessages(errModel);

        emit(AuthLoginError(
            message: errModel.message.tr(),
            // statusCode: errModel.statusCode,
            // successfull: errModel.successful,
            data: parsedError));
        return null;
      },
      (logInModel) => emit(AuthLoginSuccess(token: logInModel.data[ApiKey.token])),
    );
  }

  //! logout
  logout() async {
    emit(AuthLogoutLoading());
    final response = await authRepository.logout();
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold
        // final parsedError = _parseErrorMessages(errModel);
        emit(AuthLogoutError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
          // data: parsedError,
        ));
        return null;
      },
      (logoutModel) => emit(AuthLogoutSuccess()),
    );
  }

  //! profile
  profile() async {
    emit(AuthProfileLoading());
    final response = await authRepository.profile();
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        // final parsedError = _parseErrorMessages(errModel);

        emit(AuthProfileError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
        ));
        return null;
      },
      (profileModel) => emit(AuthProfileSuccess(message: profileModel.message)),
    );
  }

  //! update
  update() async {
    emit(AuthUpdateLoading());
    final response = await authRepository.update();
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        final parsedError = _parseErrorMessages(errModel);

        emit(AuthUpdateError(
            message: errModel.message.tr(),
            // statusCode: errModel.statusCode,
            // successfull: errModel.successful,
            data: parsedError));
        return null;
      },
      (updateModel) => emit(AuthUpdateSuccess(message: updateModel.message)),
    );
  }

  //! forgetPassword
  forgetPassword({
    required String email,
  }) async {
    emit(AuthForgetPasswordLoading());
    final response = await authRepository.forgetPassword(
      email: email,
    );
    response.fold(
      (errModel) {
        final parsedError = _parseErrorMessages(errModel);

        emit(AuthForgetPasswordError(
            message: errModel.message,
            // statusCode: errModel.statusCode,
            // successfull: errModel.successful,
            data: 'خطأ \n${parsedError}'));
        return null;
      },
      (signUpModel) =>
          emit(AuthForgetPasswordSuccess(message: signUpModel.message)),
    );
  }

  //! ResetPassword
  resetPassword({
    required String email,
  }) async {
    emit(AuthResetPasswordLoading());
    final response = await authRepository.resetPassword(
      email: email,
    );
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        final parsedError = _parseErrorMessages(errModel);

        emit(AuthResetPasswordError(
            message: errModel.message.tr(),
            // statusCode: errModel.statusCode,
            // successfull: errModel.successful,
            data: parsedError));
        return null;
      },
      (resetPasswordModel) =>
          emit(AuthResetPasswordSuccess(message: resetPasswordModel.message)),
    );
  }

  //! ResendOTP
  resendOTP({
    required String email,
    required String subject,
  }) async {
    emit(AuthResendOTPLoading());
    final response =
        await authRepository.resendOTP(email: email, subject: subject);
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        // final parsedError = _parseErrorMessages(errModel);

        emit(AuthResendOTPError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
          // data: parsedError,
        ));
        return null;
      },
      (resendOTPModel) => emit(AuthResendOTPSuccess()),
    );
  }

  //! Delete Account
  delete() async {
    emit(AuthDeleteLoading());
    final response = await authRepository.delete();
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        // final parsedError = _parseErrorMessages(errModel);

        emit(AuthDeleteError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
        ));
        return null;
      },
      (deleteModel) => emit(AuthDeleteSuccess(message: deleteModel.message)),
    );
  }

  //! RefreshToken
  refreshToken({
    required String oldToken,
  }) async {
    emit(AuthRefreshTokenLoading());
    final response = await authRepository.refreshToken(oldToken: oldToken);
    response.fold(
      (errModel) {
        //! I can put here the logic for handling errMessage and Translate it to arabic and send it to Scaffold

        // final parsedError = _parseErrorMessages(errModel);

        emit(AuthRefreshTokenError(
          message: errModel.message.tr(),
          // statusCode: errModel.statusCode,
          // successfull: errModel.successful,
        ));
        return null;
      },
      (refreshTokenModel) => emit(AuthRefreshTokenSuccess(
          message: refreshTokenModel.message,
          data: refreshTokenModel.data['token'])),
    );
  }
}

String _parseErrorMessages(ErrorModel errorResponse) {
  final data = errorResponse.data;
  if (data == null) return 'unexpected_error'.tr();

  final List<String> errors = [];

  data.forEach((key, value) {
    // مثال: لو السيرفر يرجع {"email": ["The email has already been taken."]}
    if (value is List) {
      for (var msg in value) {
        errors.add(msg.toString().tr());
      }
    } else if (value is String) {
      errors.add(value.tr());
    }
  });

  return errors.join('\n');
}
