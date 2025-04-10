import 'package:abo_bashir_market/core/functions/parse_error_message.dart';
import 'package:abo_bashir_market/features/product/data/models/clean/product.dart';
import 'package:abo_bashir_market/features/product/domain/repository/product_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());

  // //! Get All Products
  getAllProducts({
    required int pageNumber,
    required int items,
    required String column,
    required String direction,
  }) async {
    emit(ProductGetAllLoading());
    final response = await productRepository.getAllProducts(
        pageNumber: pageNumber,
        items: items,
        column: column,
        direction: direction);
    response.fold((errModel) {
      final errorParsedData = parseErrorMessages(errModel);
      emit(ProductGetAllError(
          message: errModel.message,
          statusCode: errModel.statusCode,
          successful: errModel.successful,
          rawData: 'خطأ \n${errorParsedData}'));
      return null;
    }, (getAllProductsModel) {
      emit(
        ProductGetAllSuccess(
          products: getAllProductsModel.data.products ?? [],
          totalPages: getAllProductsModel.data.totalPages ?? 1,
          currentPage: getAllProductsModel.data.currentPage ?? 1,
          hasMorePages: getAllProductsModel.data.hasMorePages ?? false,
          message: getAllProductsModel.message,
          statusCode: getAllProductsModel.statusCode,
          successful: getAllProductsModel.successful,
          rawData: getAllProductsModel.data,
        ),
      );
    });
  }

  //! Create Product
  createProduct(
    // Map<String, dynamic> productData,
    String name,
    int price,
    int categoryID,
    String image,
  ) async {
    emit(ProductCreateLoading());
    final response = await productRepository.createProduct(
        // productData: productData,
        name: name,
        price: price,
        categoryID: categoryID,
        image: image);
    response.fold(
      (errModel) {
        final errorParsedData = parseErrorMessages(errModel);
        emit(
          ProductCreateError(
              message: errModel.message,
              statusCode: errModel.statusCode,
              successful: errModel.successful,
              rawData: 'خطأ \n${errorParsedData}'),
        );
        return null;
      },
      (signUpModel) => emit(
        ProductCreateSuccess(
          message: signUpModel.message,
          statusCode: signUpModel.statusCode,
          successful: signUpModel.successful,
          rawData: signUpModel.data,
        ),
      ),
    );
  }

  //! Get Product by ID
  getProductById({required int id}) async {
    emit(ProductGetByIdLoading());
    final response = await productRepository.getProductById(id: id);
    response.fold(
      (errModel) {
        final errorParsedData = parseErrorMessages(errModel);
        emit(ProductGetByIdError(
            message: errModel.message,
            statusCode: errModel.statusCode,
            successful: errModel.successful,
            rawData: 'خطأ \n${errorParsedData}'));
        return null;
      },
      (productModel) => emit(
        ProductGetByIdSuccess(
          product: productModel.data.product!,
          message: productModel.message,
          statusCode: productModel.statusCode,
          successful: productModel.successful,
          rawData: productModel.data,
        ),
      ),
    );
  }

  //! Update Product
  updateProduct({
    // required Map<String, dynamic> updatedData,
    required int productId,
    required String name,
    required int price,
    required int categoryID,
    required String image,
  }) async {
    emit(ProductUpdateLoading());
    final response = await productRepository.updateProduct(
      // updatedData: updatedData,
      productId: productId,
      name: name,
      price: price,
      categoryID: categoryID,
      image: image,
    );
    response.fold(
      (errModel) {
        final errorParsedData = parseErrorMessages(errModel);
        emit(
          ProductUpdateError(
            message: errModel.message,
            statusCode: errModel.statusCode,
            successful: errModel.successful,
            rawData: 'خطأ \n${errorParsedData}',
          ),
        );
        return null;
      },
      (updateProductModel) => emit(ProductUpdateSuccess(
        message: updateProductModel.message,
        statusCode: updateProductModel.statusCode,
        successful: updateProductModel.successful,
        rawData: updateProductModel.data,
      )),
    );
  }

  //! Delete Product
  deleteProduct({required int productId}) async {
    emit(ProductDeleteLoading());
    final response =
        await productRepository.deleteProduct(productId: productId);
    response.fold(
      (errModel) {
        final errorParsedData = parseErrorMessages(errModel);
        emit(ProductDeleteError(
            message: errModel.message,
            statusCode: errModel.statusCode,
            successful: errModel.successful,
            rawData: 'خطأ \n${errorParsedData}'));
        return null;
      },
      (deletedProductModel) => emit(ProductDeleteSuccess(
        message: deletedProductModel.message,
        statusCode: deletedProductModel.statusCode,
        successful: deletedProductModel.successful,
        rawData: deletedProductModel.data,
      )),
    );
  }
}
