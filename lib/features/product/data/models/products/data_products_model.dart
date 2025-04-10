// import 'package:abo_bashir_market/core/databases/api/end_points.dart';
// import 'package:abo_bashir_market/features/product/data/models/product/product_model.dart';

// class DataProductsModel {
//   final List<ProductModel> products;
//   final int totalPages;
//   final int currentPage;
//   final bool hasMorePages;
//   DataProductsModel({
//     required this.products,
//     required this.totalPages,
//     required this.currentPage,
//     required this.hasMorePages,
//   });

//   factory DataProductsModel.fromJson(Map<String, dynamic> jsonData) {
//     var productsList = jsonData[ApiKey.Products] as List;
//     List<ProductModel> products =
//         productsList.map((i) => ProductModel.fromJson(i)).toList();

//     return DataProductsModel(
//       products: products,
//       totalPages: jsonData[ApiKey.total_pages],
//       currentPage: jsonData[ApiKey.current_page],
//       hasMorePages: jsonData[ApiKey.hasMorePages],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       ApiKey.Products: products.map((product) => product.toJson()).toList(),
//       ApiKey.total_pages: totalPages,
//       ApiKey.current_page: currentPage,
//       ApiKey.hasMorePages: hasMorePages,
//     };
//   }
// }
