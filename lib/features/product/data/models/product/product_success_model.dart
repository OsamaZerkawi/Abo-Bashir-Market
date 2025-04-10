// import 'dart:convert';

// import 'package:abo_bashir_market/core/databases/api/end_points.dart';
// import 'package:abo_bashir_market/features/product/data/models/product/data_product_model.dart';

// class ProductSuccessModel {
//   final bool successful;
//   final String message;
//   final int statusCode;
//   final DataProductModel data;

//   ProductSuccessModel({
//     required this.successful,
//     required this.message,
//     required this.statusCode,
//     required this.data,
//   });

//   factory ProductSuccessModel.fromJson(Map<String, dynamic> jsonData) {
//     print(jsonData.toString());
//     return ProductSuccessModel(
//         successful: jsonData[ApiKey.successful],
//         message: jsonData[ApiKey.message],
//         statusCode: jsonData[ApiKey.status_code],
//         data: DataProductModel.fromJson(jsonData[ApiKey.data]));
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       ApiKey.successful: successful,
//       ApiKey.message: message,
//       ApiKey.status_code: statusCode,
//       ApiKey.data: data,
//     };
//   }
// }
