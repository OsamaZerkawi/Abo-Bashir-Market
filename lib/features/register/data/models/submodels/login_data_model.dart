import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/data/models/submodels/user_model.dart';

class LoginDataModel {
  UserModel user;
  String token;
  LoginDataModel({
    required this.user,
    required this.token,
  });
  factory LoginDataModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginDataModel(
      user: UserModel.fromJson(jsonData[ApiKey.user]),
      token: jsonData[ApiKey.token],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.user: user,
      ApiKey.token: token,
    };
  }
}
