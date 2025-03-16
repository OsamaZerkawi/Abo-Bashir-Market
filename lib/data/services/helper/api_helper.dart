import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String baseUrl;

  ApiHelper({required this.baseUrl}); // Allows setting a base URL for the API

  /// Private method to generate headers dynamically
  Map<String, String> _getHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  /// Handles API responses and errors

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Request failed with status: ${response.statusCode}\nBody: ${response.body}',
      );
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
}
