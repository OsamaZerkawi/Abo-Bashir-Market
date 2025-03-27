import 'package:abo_bashir_market/core/api/end_points.dart';

//SignIN
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
      statusCode: jsonData[ApiKey.statusCode],
      message: jsonData[ApiKey.message],
      successful: jsonData[ApiKey.successful],
      data: jsonData[ApiKey.data],
    );
  }
}
