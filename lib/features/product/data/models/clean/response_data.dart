import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/product/data/models/clean/product.dart';

class ResponseData {
  final List<Product>? products; // For the list response
  final Product? product; // For the single product response
  final int? totalPages;
  final int? currentPage;
  final bool? hasMorePages;

  ResponseData({
    this.products,
    this.product,
    this.totalPages,
    this.currentPage,
    this.hasMorePages,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    // Handle both list and single product responses
    List<Product>? products;
    Product? product;

    if (json[ApiKey.Products] != null) {
      var productsList = json[ApiKey.Products] as List;
      products = productsList.map((i) => Product.fromJson(i)).toList();
    } else if (json[ApiKey.Products] != null) {
      product = Product.fromJson(json[ApiKey.Products]);
    }

    return ResponseData(
      products: products,
      product: product,
      totalPages: json[ApiKey.total_pages],
      currentPage: json[ApiKey.current_page],
      hasMorePages: json[ApiKey.hasMorePages],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (products != null)
        ApiKey.Products: products!.map((p) => p.toJson()).toList(),
      if (product != null) ApiKey.product: product!.toJson(),
      if (totalPages != null) ApiKey.total_pages: totalPages,
      if (currentPage != null) ApiKey.current_page: currentPage,
      if (hasMorePages != null) ApiKey.hasMorePages: hasMorePages,
    };
  }
}


// Usage Examples:

// For list response:
// final response1 = ApiResponse.fromJson(jsonDecode(listResponseJson));
// print(response1.data.products?[0].name); // Access the list

// For single product response:
// final response2 = ApiResponse.fromJson(jsonDecode(singleProductJson));
// print(response2.data.product?.name); // Access the single product