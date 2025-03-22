import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

final String baseUrl = 'http://192.168.81.38:8000/api';

class ApiHelper {
  ApiHelper();

  /// Performs a DELETE request
  Future<dynamic> delete({
    required String endpoint,
    String? token,
  }) async {
    try {
      http.Response response = await http
          .delete(Uri.parse('$baseUrl$endpoint'), headers: _getHeaders(token))
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      throw Exception('DELETE request error: $e');
    }
  }

  /// Performs a GET request
  Future<dynamic> get({
    required String endpoint,
    String? token,
  }) async {
    try {
      http.Response response = await http
          .get(Uri.parse('$baseUrl$endpoint'), headers: _getHeaders(token))
          .timeout(const Duration(seconds: 10)); // Add timeout

      return _handleResponse(response);
    } catch (e) {
      throw Exception('GET request error: $e');
    }
  }

  /// Performs a POST request
  Future<dynamic> post({
    required String endpoint,
    required dynamic body,
    String? token,
  }) async {
    try {
      http.Response response = await http
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: _getHeaders(token),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      throw Exception('POST request error: $e');
    }
  }

  Future<dynamic> postWithMultipart({
    required String endpoint,
    required Map<String, dynamic> fields,
    File? image,
    String? token,
  }) async {
    try {
      var uri = Uri.parse('$baseUrl$endpoint');
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(_getHeaders(token));

      fields.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      if (image != null) {
        var imageStream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          'image',
          imageStream,
          length,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);
      }

      var response = await request.send();
      var responseString = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(responseString);
      } else {
        // Parse the error response and throw it as a Map
        var errorResponse = jsonDecode(responseString);
        throw errorResponse; // Throw the error response directly
      }
    } catch (e) {
      // If the error is already a Map, rethrow it
      if (e is Map<String, dynamic>) {
        rethrow;
      } else {
        // Otherwise, wrap it in a generic exception
        throw Exception('POST request error: $e');
      }
    }
  }

  /// Performs a PUT request
  Future<dynamic> put({
    required String endpoint,
    required dynamic body,
    String? token,
  }) async {
    try {
      http.Response response = await http
          .put(
            Uri.parse('$baseUrl$endpoint'),
            headers: _getHeaders(token),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } catch (e) {
      throw Exception('PUT request error: $e');
    }
  }

  /// Private method to generate headers dynamically
  Map<String, String> _getHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}

/// Handles API responses and errors

//   dynamic _handleResponse(http.Response response) {
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//         'Request failed with status: ${response.statusCode}\nBody: ${response.body}',
//       );
//     }
//   }

//This code is very good but i still didn't learn how to use it
class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);

  @override
  String toString() => 'ApiException($statusCode): $message';
}

dynamic _handleResponse(http.Response response) {
  try {
    final dynamic decodedBody =
        response.body.isNotEmpty ? jsonDecode(response.body) : null;

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return decodedBody ?? {}; // Success response with data

      case 204:
        return {}; // No Content, return empty map

      case 400:
        throw ApiException(
          decodedBody?['message'] ?? 'طلب غير صالح (Bad Request)',
          400,
        );

      case 401:
        throw ApiException(
          decodedBody?['message'] ??
              'غير مصرح لك. الرجاء تسجيل الدخول مرة أخرى.',
          401,
        );

      case 403:
        throw ApiException(
          decodedBody?['message'] ?? 'تم رفض الوصول! ليس لديك إذن.',
          403,
        );

      case 404:
        throw ApiException(
          decodedBody?['message'] ?? 'المورد غير موجود!',
          404,
        );

      case 405:
        throw ApiException(
          decodedBody?['message'] ?? 'الطريقة غير مسموحة (Method Not Allowed)',
          405,
        );

      case 409:
        throw ApiException(
          decodedBody?['message'] ?? 'هناك تعارض في الطلب (Conflict)',
          409,
        );

      case 422:
        // Validation errors (e.g., missing required fields)
        final errors = decodedBody?['errors'];
        if (errors is Map) {
          final formattedErrors = errors.entries
              .map((entry) => "${entry.key}: ${entry.value}")
              .join("\n");
          throw ApiException(formattedErrors, 422);
        } else {
          throw ApiException(
            decodedBody?['message'] ??
                'فشل التحقق من صحة البيانات (Unprocessable Entity)',
            422,
          );
        }

      case 500:
        throw ApiException(
          'خطأ داخلي في الخادم. الرجاء المحاولة لاحقًا.',
          500,
        );

      case 502:
      case 503:
      case 504:
        throw ApiException(
          'الخادم غير متوفر حاليًا. يرجى المحاولة لاحقًا.',
          response.statusCode,
        );

      default:
        throw ApiException(
          'حدث خطأ غير متوقع: ${response.statusCode}',
          response.statusCode,
        );
    }
  } catch (e) {
    throw ApiException('فشل في معالجة الاستجابة: $e', response.statusCode);
  }
}
