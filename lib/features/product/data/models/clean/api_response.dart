import 'package:abo_bashir_market/features/product/data/models/clean/response_data.dart';

class ApiResponse {
  final bool successful;
  final String message;
  final ResponseData data;
  final int statusCode;

  ApiResponse({
    required this.successful,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      successful: json['successful'],
      message: json['message'],
      data: ResponseData.fromJson(json['data']),
      statusCode: json['status_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'successful': successful,
      'message': message,
      'data': data.toJson(),
      'status_code': statusCode,
    };
  }
}
