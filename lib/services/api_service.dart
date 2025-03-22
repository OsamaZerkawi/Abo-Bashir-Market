import 'dart:io';

import 'package:abo_bashir_market/services/helper/api_helper.dart';

class ApiService {
  final ApiHelper _apiHelper;

  ApiService() : _apiHelper = ApiHelper();

  /// Email Verification
  Future<dynamic> emailVerify({
    required String email,
    required String otp,
  }) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'otp': otp,
    };
    return await _apiHelper.post(
        endpoint: '/users/emailVerify', body: requestBody);
  }

  /// Resend OTP for Email Verification or Password Reset
  Future<dynamic> resendOTP({
    required String subject, // subject can be 'password' or 'email'
    required String email,
  }) async {
    final Map<String, dynamic> requestBody = {
      'subject': subject,
      'email': email,
    };

    return await _apiHelper.post(
        endpoint: '/users/resendOTP', body: requestBody);
  }

  login(Map<String, dynamic> loginData) {}

  logout(String token) {}

  Future<dynamic> registerUser({
    required Map<String, dynamic> userData,
    File? image,
  }) async {
    final Map<String, dynamic> requestBody = {
      'first_name': userData['first_name'],
      'last_name': userData['last_name'],
      'email': userData['email'],
      'password': userData['password'],
      'password_confirmation': userData['password_confirmation'],
      'app_password': userData['app_password'],
      'image': userData['image'] ?? '',
    };

    try {
      final response = await _apiHelper.postWithMultipart(
        endpoint: '/users/register',
        fields: requestBody,
        image: image,
      );
      return response;
    } catch (e) {
      if (e is Map<String, dynamic>) {
        rethrow; // Re-throw the error response as a Map
      } else {
        throw Exception('Failed to register user: $e');
      }
    }
  }
}
