import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  // Base URL of Laravel API
  static const String baseUrl = "https://yourbackend.com/api";

  ApiService() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
      },
    ));

    // Adding Interceptor for Authorization Token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("Request [${options.method}] => PATH: ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("Response: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("Error: ${e.response?.data}");
        return handler.next(e);
      },
    ));
  }

  /// **User Signup**
  Future<Response> register(Map<String, dynamic> userData) async {
    try {
      Response response = await dio.post('/register', data: userData);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **User Login**
  Future<Response> login(Map<String, dynamic> loginData) async {
    try {
      Response response = await dio.post('/login', data: loginData);
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Logout User**
  Future<Response> logout(String token) async {
    try {
      Response response = await dio.post('/logout',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Forgot Password**
  Future<Response> forgotPassword(String email) async {
    try {
      Response response =
          await dio.post('/forgot-password', data: {'email': email});
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Verify OTP**
  Future<Response> verifyOtp(String email, String otp) async {
    try {
      Response response =
          await dio.post('/verify-otp', data: {'email': email, 'otp': otp});
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Reset Password**
  Future<Response> resetPassword(
      String email, String newPassword, String confirmPassword) async {
    try {
      Response response = await dio.post('/reset-password', data: {
        'email': email,
        'password': newPassword,
        'password_confirmation': confirmPassword,
      });
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Update User Profile**
  Future<Response> updateProfile(
      String token, Map<String, dynamic> data) async {
    try {
      Response response = await dio.put('/user/update',
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Upload Profile Image**
  Future<Response> uploadProfileImage(String token, String filePath) async {
    try {
      FormData formData = FormData.fromMap({
        'image':
            await MultipartFile.fromFile(filePath, filename: 'profile.jpg'),
      });

      Response response = await dio.post('/user/upload-image',
          data: formData,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// **Error Handling**
  String _handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return error.response!.data['message'] ?? 'Unknown error occurred';
      } else {
        return "Network error: Please check your connection.";
      }
    } else {
      return "Unexpected error occurred.";
    }
  }
}
