import 'package:abo_bashir_market/core/databases/api/api_consumer.dart';
import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/core/errors/error_model.dart';
import 'package:abo_bashir_market/core/errors/exceptions.dart';
import 'package:abo_bashir_market/features/product/data/models/clean/api_response.dart';
import 'package:abo_bashir_market/response/general_response_model.dart';
import 'package:dartz/dartz.dart';

class ProductRepository {
  final ApiConsumer api;

  ProductRepository({required this.api});

  //! Get All Products
  Future<Either<ErrorModel, ApiResponse>> getAllProducts({
    required int pageNumber,
    required int items,
    required String column,
    required String direction,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getAllProducts,
        queryParameters: {
          ApiKey.page: pageNumber,
          ApiKey.items: items,
          ApiKey.column: column,
          ApiKey.direction: direction
        },
      );
      final getAllProductsResponse = ApiResponse.fromJson(response);
      return Right(getAllProductsResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Create Product
  //? (name, price, categoryID, image => productData)
  Future<Either<ErrorModel, GeneralResponseModel>> createProduct({
    // required Map<String, dynamic> productData,
    required String name,
    required int price,
    required int categoryID,
    required String image,
  }) async {
    try {
      final response = await api.post(
        EndPoint.createProduct,
        isFormData: true,
        data: {
          ApiKey.name: name,
          ApiKey.price: price,
          ApiKey.category_id: categoryID,
          ApiKey.image: image,
        },
      );
      final createProductResponse = GeneralResponseModel.fromJson(response);
      return Right(createProductResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Get Product by ID
  Future<Either<ErrorModel, ApiResponse>> getProductById({
    required int id,
  }) async {
    try {
      final response = await api.get(
        '${EndPoint.getProductById}/$id',
      );
      final getProductByIdResponse = ApiResponse.fromJson(response);
      return Right(getProductByIdResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Update Product
  Future<Either<ErrorModel, GeneralResponseModel>> updateProduct({
    // required Map<String, dynamic> updatedData,
    required int productId,
    required String name,
    required int price,
    required int categoryID,
    required String image,
  }) async {
    try {
      final response = await api.post(
        '${EndPoint.updateProduct}/$productId',
        isFormData: true,
        // data: updatedData,
        data: {
          ApiKey.name: name,
          ApiKey.price: price,
          ApiKey.category_id: categoryID,
          ApiKey.image: image,
        },
      );
      final updateProductResponse = GeneralResponseModel.fromJson(response);
      return Right(updateProductResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Delete Product
  Future<Either<ErrorModel, GeneralResponseModel>> deleteProduct({
    required int productId,
  }) async {
    try {
      final response = await api.delete(
        '${EndPoint.deleteProduct}/$productId',
      );
      final deleteProductResponse = GeneralResponseModel.fromJson(response);
      return Right(deleteProductResponse);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }

  //! Paginate Products (Load next page)
  // Future<Either<ErrorModel, GeneralResponseModel>> paginateProducts({
  //   required int page,
  // }) async {
  //   try {
  //     final response = await api.get(
  //       EndPoint.getAllProducts,
  //       queryParameters: {'page': page},
  //     );
  //     final result = GeneralResponseModel.fromJson(response);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel);
  //   }
  // }
}
