import 'package:abo_bashir_market/core/databases/api/end_points.dart';

//Error Model From My API
class ErrorModel {
  final bool successful;
  final String message;
  final dynamic data;
  final int statusCode;

  ErrorModel({
    required this.successful,
    required this.message,
    this.data,
    required this.statusCode,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.status_code],
      message: jsonData[ApiKey.message],
      successful: jsonData[ApiKey.successful],
      data: jsonData[ApiKey.data],
    );
  }
}
