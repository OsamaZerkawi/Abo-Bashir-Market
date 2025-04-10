import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/data/models/submodels/user_model.dart';

class DataModel {
  UserModel user;

  DataModel({
    required this.user,
  });
  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      user: UserModel.fromJson(jsonData[ApiKey.user]),
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.user: user};
  }
}
