import 'package:abo_bashir_market/core/databases/api/end_points.dart';

class GeneralResponseModel {
  final bool successful;
  final String message;
  final int statusCode;
  final dynamic data;

  GeneralResponseModel({
    required this.successful,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return GeneralResponseModel(
        successful: jsonData[ApiKey.successful],
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.status_code],
        data: jsonData[ApiKey.data]);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.successful: successful,
      ApiKey.message: message,
      ApiKey.status_code: statusCode,
      ApiKey.data: data,
    };
  }
}
