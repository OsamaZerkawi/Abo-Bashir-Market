// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/data/models/submodels/data_model.dart';

//Means The respond data from signup func
class SignUpModel {
  final bool successful;
  final String message;
  final int statusCode;
  final DataModel data;

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
      statusCode: jsonData[ApiKey.status_code],
      data: DataModel.fromJson(jsonData[ApiKey.data]),
    );
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
