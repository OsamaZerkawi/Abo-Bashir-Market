import 'package:abo_bashir_market/cache/cache_helper.dart';
import 'package:abo_bashir_market/core/api/api_consumer.dart';
import 'package:abo_bashir_market/core/api/end_points.dart';
import 'package:abo_bashir_market/core/errors/error_model.dart';
import 'package:abo_bashir_market/core/errors/exceptions.dart';
import 'package:abo_bashir_market/core/functions/upload_image_to_api.dart';
import 'package:abo_bashir_market/data/models/login_model.dart';
import 'package:abo_bashir_market/data/models/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  // final ApiConsumer apiConsumer;
  final ApiConsumer api;

  AuthRepository({required this.api});

  //! Because this has two return type (Success Case & Failure Case) => we will use dartz
  Future<Either<String, LoginModel>> signIn({
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
      return Left(e.errModel.message);
    }
  }

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
      // emit(AuthSignUpError(
      //   message: e.errModel.message,
      //   statusCode: e.errModel.statusCode,
      //   successfull: e.errModel.successful,
      //   data: e.errModel.data,
      // ));
      return Left(e.errModel);
      debugPrint('e.errModel.message: ${e.errModel.message}');
      debugPrint('e.errModel.statusCode: ${e.errModel.statusCode}');
      debugPrint('e.errModel.successful: ${e.errModel.successful}');
      debugPrint('e.errModel.data,: ${e.errModel.data}');
    }
  }
}
