import 'package:abo_bashir_market/cache/cache_helper.dart';
import 'package:abo_bashir_market/core/api/api_consumer.dart';
import 'package:abo_bashir_market/core/api/end_points.dart';
import 'package:abo_bashir_market/core/errors/error_model.dart';
import 'package:abo_bashir_market/core/errors/exceptions.dart';
import 'package:abo_bashir_market/core/functions/upload_image_to_api.dart';
import 'package:abo_bashir_market/data/models/forget_password_model.dart';
import 'package:abo_bashir_market/data/models/general_response_model.dart';
import 'package:abo_bashir_market/data/models/login_model.dart';
import 'package:abo_bashir_market/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final ApiConsumer api;

  AuthRepository({required this.api});

  //! SignUp
  //* Because this has two return type (Success Case & Failure Case) => we will use dartz
  Future<Either<ErrorModel, SignUpModel>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String appPassword,
    required String image,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        isFormData: true,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.passwordConfirm: passwordConfirm,
          ApiKey.appPassword: appPassword,
          ApiKey.image: await uploadImageToAPI(image),
        },
      );
      final userSignUp = SignUpModel.fromJson(response);
      return right(userSignUp);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! EmailVerify
  Future<Either<ErrorModel, GeneralResponseModel>> emailVerify({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await api.post(
        EndPoint.emailVerify,
        data: {
          ApiKey.email: email,
          ApiKey.otp: otp,
        },
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Login
  Future<Either<ErrorModel, LoginModel>> logIn({
    required String email,
    required String password,
    required String fcmToken,
    required bool rememberMe,
  }) async {
    try {
      final response = await api.post(EndPoint.logIn, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.fcmToken: fcmToken,
        ApiKey.rememberMe: rememberMe
      });
      final userLogin = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(userLogin.data[ApiKey.token]);
      debugPrint('decodedToken: ${decodedToken}');
      //save token only
      CacheHelper().saveData(
        key: ApiKey.token,
        value: userLogin.data[ApiKey.token],
      );
      return Right(userLogin);
      // debugPrint('shared :   ${CacheHelper().getData(key: ApiKey.token)}');
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! logout
  //? Here I need Authorization
  Future<Either<ErrorModel, GeneralResponseModel>> logout() async {
    try {
      final response = await api.post(
        EndPoint.logout,
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! profile
  //? Here I need Authorization
  Future<Either<ErrorModel, GeneralResponseModel>> profile() async {
    try {
      final response = await api.get(
        EndPoint.profile,
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! update
  //? Here I need Authorization
  Future<Either<ErrorModel, GeneralResponseModel>> update() async {
    try {
      final response = await api.post(
        EndPoint.update,
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! ForgetPassword
  Future<Either<ErrorModel, ForgetPasswordModel>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.forgetPassword,
        data: {
          ApiKey.email: email,
        },
      );
      final forgetPasswordRespond = ForgetPasswordModel.fromJson(response);
      return right(forgetPasswordRespond);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  //! ResetPassword
  Future<Either<ErrorModel, GeneralResponseModel>> resetPassword({
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.resetPassword,
        data: {
          ApiKey.email: email,
        },
      );
      final resetPasswordRespond = GeneralResponseModel.fromJson(response);
      return right(resetPasswordRespond);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  //! Resend OTP
  Future<Either<ErrorModel, GeneralResponseModel>> resendOTP({
    /// Resend OTP for Email Verification or Password Reset
    required String subject, // subject can be 'password' or 'email'
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.resendOTP,
        data: {
          ApiKey.subject: subject,
          ApiKey.email: email,
        },
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Delete Account
  //? Here I need Authorization
  Future<Either<ErrorModel, GeneralResponseModel>> delete() async {
    try {
      final response = await api.delete(
        EndPoint.delete,
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Refresh Token
  Future<Either<ErrorModel, GeneralResponseModel>> refreshToken({
    required String oldToken,
  }) async {
    try {
      final response = await api.post(
        EndPoint.refreshToken,
        data: {
          ApiKey.token: oldToken,
        },
      );
      final generalResponse = GeneralResponseModel.fromJson(response);
      return right(generalResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}
