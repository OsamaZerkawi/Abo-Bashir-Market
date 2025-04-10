//Means The respond data from login func
import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/data/models/submodels/data_model.dart';

class ForgetPasswordModel {
  final bool successful;
  final String message;
  final int statusCode;
  final DataModel data;

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
        statusCode: jsonData[ApiKey.status_code],
        data: DataModel.fromJson(jsonData[ApiKey.data]));
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.successful: successful,
      ApiKey.message: message,
      ApiKey.status_code: statusCode,
      ApiKey.data: data
    };
  }
}
