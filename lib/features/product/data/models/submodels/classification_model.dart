import 'package:abo_bashir_market/core/databases/api/end_points.dart';

class ClassificationModel {
  final int id;
  final String name;

  ClassificationModel({
    required this.id,
    required this.name,
  });
  factory ClassificationModel.fromJson(Map<String, dynamic> jsonData) {
    return ClassificationModel(
      id: jsonData[ApiKey.id],
      name: jsonData[ApiKey.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
    };
  }
}
