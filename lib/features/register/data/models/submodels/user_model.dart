import 'package:abo_bashir_market/core/databases/api/end_points.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
   
    return UserModel(
      firstName: jsonData[ApiKey.first_name],
      lastName: jsonData[ApiKey.last_name],
      email: jsonData[ApiKey.email],
      image: jsonData[ApiKey.image] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.first_name: firstName,
      ApiKey.last_name: lastName,
      ApiKey.email: email,
      ApiKey.image: image
    };
  }
}
