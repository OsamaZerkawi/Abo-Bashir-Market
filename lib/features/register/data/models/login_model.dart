import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/data/models/submodels/login_data_model.dart';

//Means The respond data from login func
class LoginModel {
  final bool successful;
  final String message;
  final int statusCode;
  final LoginDataModel data;

  LoginModel({
    required this.successful,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    print('jsonData logoin model: ${jsonData}');

    return LoginModel(
        successful: jsonData[ApiKey.successful],
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.status_code],
        data: LoginDataModel.fromJson(jsonData[ApiKey.data]));
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

// {
//   "successful": true,
//   "message": "Logged in successfully",
//   "status_code": 200,
//   "data": {
//     "user": {
//       "first_name": "Omar",
//       "last_name": "Borhom",
//       "email": "habuazan@gmail.com",
//       "image": "http://127.0.0.1:8000/storage/images/tfg43fGPSvMYQ3AGZsJFtYTrqCxibGHSiaRSaZpk.png"
//     },
//     "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
//   }
// }
