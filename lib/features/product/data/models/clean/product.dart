
class Product {
  final int id;
  final String name;
  final String? image; // Nullable
  final double price;
  final String category;
  // final List<Amount> amounts;

  Product({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    required this.category,
    // required this.amounts,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // var amountsList = json['amounts'] as List;
    // List<Amount> amounts = amountsList.map((i) => Amount.fromJson(i)).toList();

    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
      category: json['category'],
      // amounts: amounts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'category': category,
      // 'amounts': amounts.map((amount) => amount.toJson()).toList(),
    };
  }
}
