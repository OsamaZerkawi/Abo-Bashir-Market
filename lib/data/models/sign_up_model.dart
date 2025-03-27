import 'package:abo_bashir_market/core/api/end_points.dart';

class SignUpModel {
  final bool successful;
  final String message;
  final int statusCode;
  final dynamic data;

  SignUpModel({
    required this.successful,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        successful: jsonData[ApiKey.successful],
        message: jsonData[ApiKey.message],
        statusCode: jsonData[ApiKey.statusCode],
        data: jsonData[ApiKey.data]);
  }
}

// {
//   "successful": true,
//   "message": "User registered successfully! ,check your email for verification code",
//   "data": {
//     "user": {
//       "first_name": "Nour alden",
//       "last_name": "Khlil",
//       "email": "khlilnoor0@gmail.com",
//       "image": "https://ip:8000/storage/images/photo.jpg"
//     }
//   },
//   "status_code": 201
// }

// class LoginModel {
//   final bool successful;
//   final String message;
//   final int statusCode;
//   final dynamic data;

//   LoginModel({
//     required this.successful,
//     required this.message,
//     required this.statusCode,
//     required this.data,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
//     return LoginModel(
//         successful: jsonData[ApiKey.successful],
//         message: jsonData[ApiKey.message],
//         statusCode: jsonData[ApiKey.statusCode],
//         data: jsonData[ApiKey.data]);
//   }
// }
