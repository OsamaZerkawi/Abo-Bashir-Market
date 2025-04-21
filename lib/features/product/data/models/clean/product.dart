import 'package:abo_bashir_market/core/databases/api/end_points.dart';

class Product {
  final int id;
  final String name;
  final String? image; // Nullable
  final int currentPrice;
  final int oldPrice;
  final String category;
  // final List<Amount> amounts;

  Product({
    required this.id,
    required this.name,
    this.image,
    required this.currentPrice,
    required this.oldPrice,
    required this.category,
    // required this.amounts,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // var amountsList = json['amounts'] as List;
    // List<Amount> amounts = amountsList.map((i) => Amount.fromJson(i)).toList();
    return Product(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      image: json[ApiKey.image],
      currentPrice: json[ApiKey.current_price],
      oldPrice: json[ApiKey.old_price],
      category: json[ApiKey.category],
      // amounts: amounts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.image: image,
      ApiKey.current_price: currentPrice,
      ApiKey.old_price: oldPrice,
      ApiKey.category: category,
      // 'amounts': amounts.map((amount) => amount.toJson()).toList(),
    };
  }
}
