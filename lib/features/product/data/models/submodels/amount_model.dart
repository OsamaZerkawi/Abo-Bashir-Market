import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/product/data/models/submodels/classification_model.dart';

class AmountModel {
  final ClassificationModel classification;
  final int quantity;
  AmountModel({required this.classification, required this.quantity});

  factory AmountModel.fromJson(Map<String, dynamic> jsonData) {
    return AmountModel(
      classification:
          ClassificationModel.fromJson(jsonData[ApiKey.classification]),
      quantity: jsonData[ApiKey.quantity],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.classification: classification,
      ApiKey.quantity: quantity,
    };
  }
}
