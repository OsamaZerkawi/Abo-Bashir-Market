//Means The respond data from login func
import 'package:abo_bashir_market/core/api/end_points.dart';

class ForgetPasswordModel {
  final bool successful;
  final String message;
  final int statusCode;
  final dynamic data;

  ForgetPasswordModel({
    required this.successful,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return ForgetPasswordModel(
        successful: jsonData[ApiKey.successful],
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.statusCode],
        data: jsonData[ApiKey.data]);
  }
}
