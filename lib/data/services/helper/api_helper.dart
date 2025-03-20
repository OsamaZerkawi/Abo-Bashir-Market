import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

final String baseUrl = 'http://10.65.11.2:8000/api';

class ApiHelper {
  ApiHelper(); // Allows setting a base URL for the API

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

      // Add fields
      fields.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // If an image is selected, add it to the request
      if (image != null) {
        var imageStream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile('image', imageStream, length,
            filename: image.path.split('/').last,
            contentType: MediaType('image',
                'jpeg')); // Assuming the image is JPEG, change if necessary
        request.files.add(multipartFile);
      }

      // Send the request
      var response = await request.send();

      // Get the response as a string
      var responseString = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(responseString);
      } else {
        throw Exception(
            'Request failed with status: ${response.statusCode}\nBody: $responseString');
      }
    } catch (e) {
      throw Exception('POST request error: $e');
    }
  }
}
