// import 'dart:ffi';
import 'dart:io';

import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:abo_bashir_market/services/api_service.dart';
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
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString())); // Emit error if there is an exception
    }
  }

  Future<void> resendOTP({
    required String subject, // subject can be 'password' or 'email'
    required String email,
  }) async {
    emit(AuthLoading());
    try {
      await apiService.resendOTP(email: email, subject: subject);
      emit(AuthReSendOTPSuccess());
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

  Future<void> login({
    required String email,
    required String password,
    required String fcmToken,
    required bool rememberMe,
  }) async {
    emit(AuthLoading());
    try {
      final response = await apiService.login(
        email: email,
        password: password,
        fcmToken: fcmToken,
        rememberMe: rememberMe,
      );
      emit(AuthLoginSuccess(response['data']['token']));
    } catch (e) {
      if (e is Map<String, dynamic>) {
        if (e['status_code'] == 400) {
          emit(AuthError('الحساب غير موجود'));
        } else if (e['status_code'] == 401) {
          emit(AuthError('كلمة السر غير صحيحة'));
        } else {
          emit(AuthError(e.toString()));
        }
      } else {
        emit(AuthError('حدث خطأ غير متوقع  ${e.toString()}'));
      }
    }
  }

  Future<void> signUp(Map<String, dynamic> userData, File? image) async {
    emit(AuthLoading());
    try {
      final response =
          await apiService.registerUser(userData: userData, image: image);
      emit(AuthSuccess());
    } catch (e) {
      if (e is Map<String, dynamic>) {
        if (e['status_code'] == 401) {
          emit(AuthUnauthorized());
        } else {
          final errorMessages = _parseErrorMessages(e);
          emit(AuthError(errorMessages));
        }
      } else {
        emit(AuthError('حدث خطأ غير متوقع  ${e.toString()}'));
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

// //New
// import 'dart:io';

// import 'package:abo_bashir_market/register/cubit/auth_state.dart';
// import 'package:abo_bashir_market/services/api_service.dart';
// import 'package:abo_bashir_market/services/helper/api_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final ApiService apiService;

//   AuthCubit(this.apiService) : super(AuthInitial());

//   Future<void> emailVerify({required String email, required String otp}) async {
//     emit(AuthLoading());
//     try {
//       await apiService.emailVerify(email: email, otp: otp);
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> resendOTP(
//       {required String subject, required String email}) async {
//     emit(AuthLoading());
//     try {
//       await apiService.resendOTP(subject: subject, email: email);
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> login(Map<String, dynamic> loginData) async {
//     emit(AuthLoading());
//     try {
//       await apiService.login(loginData);
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> logout(String token) async {
//     emit(AuthLoading());
//     try {
//       await apiService.logout(token);
//       emit(AuthLogout());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> signUp(Map<String, dynamic> userData, File? image) async {
//     emit(AuthLoading());
//     try {
//       await apiService.registerUser(userData: userData, image: image);
//       emit(AuthSuccess());
//     } catch (e) {
//       if (e is ApiException) {
//         emit(AuthError(e.message));
//       } else {
//         print(e);
//         emit(AuthError('حدث خطأ غير متوقع'));
//       }
//     }
//   }
// }
