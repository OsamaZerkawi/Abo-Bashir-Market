// import 'package:abo_bashir_market/core/databases/api/end_points.dart';

// class ProductModel {
//   final int id;
//   final String name;
//   final String image;
//   final int price;
//   final String category;
//   // final AmountModel amounts;

//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.category,
//     // required this.amounts,
//   });
//   //amount has quantity and classifaction
//   // Factory method to create a Product from JSON
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json[ApiKey.id],
//       name: json[ApiKey.name],
//       image: json[ApiKey.image] ?? '', // Handle null images
//       price: (json[ApiKey.price] is String)
//           ? int.parse(json[ApiKey.price])
//           : json[ApiKey.price].toInt(),
//       category: json[ApiKey.category],
//       // amounts: AmountModel.fromJson(
//         // json[ApiKey.amounts],
//       // ), // If amounts is null, default to empty list
//     );
//   }

//   // Method to convert Product object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       ApiKey.id: id,
//       ApiKey.name: name,
//       ApiKey.image: image,
//       ApiKey.price: price,
//       ApiKey.category: category,
//       // ApiKey.amounts: amounts,
//     };
//   }
// }
