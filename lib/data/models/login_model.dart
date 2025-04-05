import 'package:abo_bashir_market/core/api/end_points.dart';

//Means The respond data from login func
class LoginModel {
  final bool successful;
  final String message;
  final int statusCode;
  final dynamic data;

  LoginModel({
    required this.successful,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
        successful: jsonData[ApiKey.successful],
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.statusCode],
        data: jsonData[ApiKey.data]);
  }
}

// class LoginData {
//   final LoginUser user;
//   final String token;

//   LoginData({required this.user, required this.token});
//   factory LoginData.fromJson(Map<String, dynamic> jsonData) {
//     return LoginData(
//         user: jsonData[ApiKey.user], token: jsonData[ApiKey.token]);
//   }
// }

// class LoginUser {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String image;

//   LoginUser(
//       {required this.firstName,
//       required this.lastName,
//       required this.email,
//       required this.image});
//   factory LoginUser.fromJson(Map<String, dynamic> jsonData) {
//     return LoginUser(
//         firstName: jsonData[ApiKey.firstName],
//         lastName: jsonData[ApiKey.lastName],
//         email: jsonData[ApiKey.email],
//         image: jsonData[ApiKey.image]);
//   }
// }

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
