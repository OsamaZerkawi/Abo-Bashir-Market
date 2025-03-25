import 'package:abo_bashir_market/core/api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String message;

  ErrorModel({required this.statusCode, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusCode: jsonData[ApiKey.statusCode],
      message: jsonData[ApiKey.message],
    );
  }
}
