//Means The respond data from login func
import '../../core/api/end_points.dart';

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
        statusCode: jsonData[ApiKey.statusCode],
        data: jsonData[ApiKey.data]);
  }
}
