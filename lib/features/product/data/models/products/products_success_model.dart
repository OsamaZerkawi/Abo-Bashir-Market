// import 'package:abo_bashir_market/core/databases/api/end_points.dart';
// import 'package:abo_bashir_market/features/product/data/models/products/data_products_model.dart';

// class ProductsSuccessModel {
//   final bool successful;
//   final String message;
//   final int statusCode;
//   final DataProductsModel data;

//   ProductsSuccessModel({
//     required this.successful,
//     required this.message,
//     required this.statusCode,
//     required this.data,
//   });

//   factory ProductsSuccessModel.fromJson(Map<String, dynamic> jsonData) {
//     print(jsonData.toString());
//     return ProductsSuccessModel(
//         successful: jsonData[ApiKey.successful],
//         message: jsonData[ApiKey.message],
//         statusCode: jsonData[ApiKey.status_code],
//         data: DataProductsModel.fromJson(jsonData[ApiKey.data]));
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       ApiKey.successful: successful,
//       ApiKey.message: message,
//       ApiKey.status_code: statusCode,
//       ApiKey.data: data.toJson(),
//     };
//   }
// }
