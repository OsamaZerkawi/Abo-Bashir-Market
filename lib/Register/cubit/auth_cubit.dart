

import 'dart:io';

import 'package:abo_bashir_market/services/api_service.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService apiService;

  AuthCubit(this.apiService) : super(AuthInitial());

  Future<void> emailVerify({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading()); // Show loading state
    try {
      final response = await apiService.emailVerify(email: email, otp: otp);
      // You can handle the response here, for example:
      // If the verification is successful:
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString())); // Emit error if there is an exception
    }
  }

  Future<void> login(Map<String, dynamic> loginData) async {
    emit(AuthLoading());
    try {
      final response = await apiService.login(loginData);
      // emit(AuthSuccess(response.data['token']));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout(String token) async {
    emit(AuthLoading());
    try {
      await apiService.logout(token);
      emit(AuthLogout());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Future<void> signUp(Map<String, dynamic> userData, File? image) async {
  //   emit(AuthLoading());
  //   try {
  //     //send data to api
  //     final response =
  //         await apiService.registerUser(userData: userData, image: image);
  //     print('(((((((((((((((())))))))))))))))');
  //     print(response);
  //     // emit(AuthSuccess(response.data['token']));
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //     print(e.toString());
  //   }
  // }

  // Future<void> signUp(Map<String, dynamic> userData, File? image) async {
  //   emit(AuthLoading());
  //   try {
  //     final response =
  //         await apiService.registerUser(userData: userData, image: image);
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     if (e is Map<String, dynamic>) {
  //       // Assuming the error response is a Map
  //       final errorMessages = _parseErrorMessages(e);
  //       emit(AuthError(errorMessages));
  //     } else {
  //       print(e);
  //       emit(AuthError('حدث خطأ غير متوقع'));
  //     }
  //   }
  // }

  // String _parseErrorMessages(Map<String, dynamic> errorResponse) {
  //   final data = errorResponse['data'];
  //   if (data == null) return 'حدث خطأ غير متوقع';

  //   final List<String> errors = [];

  //   if (data['first_name'] != null) {
  //     errors.add('الاسم الأول مستخدم بالفعل');
  //   }
  //   if (data['last_name'] != null) {
  //     errors.add('الكنية مستخدمة بالفعل');
  //   }
  //   if (data['email'] != null) {
  //     errors.add('البريد الإلكتروني مستخدم بالفعل');
  //   }
  //   if (data['password'] != null) {
  //     errors.add('كلمة المرور غير متطابقة');
  //   }
  //   if (data['password_confirmation'] != null) {
  //     errors.add('تأكيد كلمة المرور يجب أن يتطابق مع كلمة المرور');
  //   }
  //   if (data['app_password'] != null) {
  //     errors.add('كلمة مرور التطبيق غير صالحة');
  //   }

  //   return errors.join('\n');
  // }

  Future<void> signUp(Map<String, dynamic> userData, File? image) async {
    emit(AuthLoading());
    try {
      final response =
          await apiService.registerUser(userData: userData, image: image);
      emit(AuthSuccess());
    } catch (e) {
      if (e is Map<String, dynamic>) {
        // Handle the error response
        final errorMessages = _parseErrorMessages(e);
        emit(AuthError(errorMessages));
      } else {
        // Handle generic exceptions
        emit(AuthError('حدث خطأ غير متوقع'));
      }
    }
  }

  String _parseErrorMessages(Map<String, dynamic> errorResponse) {
    final data = errorResponse['data'];
    if (data == null) return 'حدث خطأ غير متوقع';

    final List<String> errors = [];

    if (data['email'] != null) {
      errors.add('البريد الإلكتروني مستخدم بالفعل');
    }
    if (data['first_name'] != null) {
      errors.add('الاسم الأول مستخدم بالفعل');
    }
    if (data['last_name'] != null) {
      errors.add('الكنية مستخدمة بالفعل');
    }
    if (data['password'] != null) {
      errors.add('كلمة المرور غير متطابقة');
    }
    if (data['password_confirmation'] != null) {
      errors.add('تأكيد كلمة المرور يجب أن يتطابق مع كلمة المرور');
    }
    if (data['app_password'] != null) {
      errors.add('كلمة مرور التطبيق غير صالحة');
    }

    return errors.join('\n');
  }
}
