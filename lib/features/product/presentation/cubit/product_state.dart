// part of 'product_cubit.dart';

// @immutable
// sealed class ProductState {}

// // Initial state
// class ProductInitial extends ProductState {}

// //! --------------------- Get All Products States ---------------------

// class ProductGetAllInitial extends ProductState {}

// class ProductGetAllLoading extends ProductState {}

// abstract class ProductPagedSuccess extends ProductState {
//   final List<Product>? products;
//   final int? totalPages;
//   final int? currentPage;
//   final bool? hasMorePages;
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic rawData;

//   ProductPagedSuccess({
//     required this.products,
//     required this.totalPages,
//     required this.currentPage,
//     required this.hasMorePages,
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.rawData,
//   });
// }

// class ProductGetAllSuccess extends ProductPagedSuccess {
//   ProductGetAllSuccess({
//     required super.products,
//     required super.totalPages,
//     required super.currentPage,
//     required super.hasMorePages,
//     required super.message,
//     required super.statusCode,
//     required super.successful,
//     required super.rawData,
//   });
// }

// class ProductGetAllError extends ProductState {
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic data;

//   ProductGetAllError({
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.data,
//   });
// }

// //! --------------------- Create Product States ---------------------

// class ProductCreateInitial extends ProductState {}

// class ProductCreateLoading extends ProductState {}

// class ProductCreateSuccess extends ProductState {
//   final String message;

//   ProductCreateSuccess({required this.message});
// }

// class ProductCreateError extends ProductState {
//   final String message;
//   final dynamic data;

//   ProductCreateError({
//     required this.message,
//     required this.data,
//   });
// }

// //! --------------------- Get Product by ID States ---------------------

// class ProductGetByIdInitial extends ProductState {}

// class ProductGetByIdLoading extends ProductState {}

// class ProductGetByIdSuccess extends ProductState {
//   final Product? product;
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic data;

//   ProductGetByIdSuccess({
//     required this.product,
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.data,
//   });
// }

// class ProductGetByIdError extends ProductState {
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic data;

//   ProductGetByIdError({
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.data,
//   });
// }

// //! --------------------- Update Product States ---------------------

// class ProductUpdateInitial extends ProductState {}

// class ProductUpdateLoading extends ProductState {}

// class ProductUpdateSuccess extends ProductState {
//   final String message;

//   ProductUpdateSuccess({required this.message});
// }

// class ProductUpdateError extends ProductState {
//   final String message;
//   final dynamic data;

//   ProductUpdateError({
//     required this.message,
//     required this.data,
//   });
// }

// //! --------------------- Delete Product States ---------------------

// class ProductDeleteInitial extends ProductState {}

// class ProductDeleteLoading extends ProductState {}

// class ProductDeleteSuccess extends ProductState {
//   final String message;

//   ProductDeleteSuccess({required this.message});
// }

// class ProductDeleteError extends ProductState {
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic data;

//   ProductDeleteError({
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.data,
//   });
// }

// //! --------------------- Pagination States ---------------------

// class ProductPaginationLoading extends ProductState {}

// class ProductPaginationSuccess extends ProductPagedSuccess {
//   ProductPaginationSuccess({
//     required super.products,
//     required super.totalPages,
//     required super.currentPage,
//     required super.hasMorePages,
//     required super.message,
//     required super.statusCode,
//     required super.successful,
//     required super.rawData,
//   });
// }

// class ProductPaginationError extends ProductState {
//   final String message;
//   final int statusCode;
//   final bool successful;
//   final dynamic data;

//   ProductPaginationError({
//     required this.message,
//     required this.statusCode,
//     required this.successful,
//     required this.data,
//   });
// }





part of 'product_cubit.dart';

@immutable
sealed class ProductState {
  const ProductState();
}

// --------------------- Base States ---------------------
class ProductInitial extends ProductState {
  const ProductInitial();
}

abstract class ProductSuccessState extends ProductState {
  final String message;
  final int statusCode;
  final bool successful;
  final dynamic rawData;

  const ProductSuccessState({
    required this.message,
    required this.statusCode,
    required this.successful,
    required this.rawData,
  });
}

abstract class ProductPagedSuccess extends ProductSuccessState {
  final List<Product> products;
  final int totalPages;
  final int currentPage;
  final bool hasMorePages;

  const ProductPagedSuccess({
    required this.products,
    required this.totalPages,
    required this.currentPage,
    required this.hasMorePages,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

abstract class ProductErrorState extends ProductState {
  final String message;
  final int statusCode;
  final bool successful;
  final dynamic rawData;

  const ProductErrorState({
    required this.message,
    required this.statusCode,
    required this.successful,
    required this.rawData,
  });
}

// --------------------- Get All Products States ---------------------
class ProductGetAllInitial extends ProductState {
  const ProductGetAllInitial();
}

class ProductGetAllLoading extends ProductState {
  const ProductGetAllLoading();
}

class ProductGetAllSuccess extends ProductPagedSuccess {
  const ProductGetAllSuccess({
    required super.products,
    required super.totalPages,
    required super.currentPage,
    required super.hasMorePages,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductGetAllError extends ProductErrorState {
  const ProductGetAllError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

// --------------------- Get Product by ID States ---------------------
class ProductGetByIdInitial extends ProductState {
  const ProductGetByIdInitial();
}

class ProductGetByIdLoading extends ProductState {
  const ProductGetByIdLoading();
}

class ProductGetByIdSuccess extends ProductSuccessState {
  final Product product;

  const ProductGetByIdSuccess({
    required this.product,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductGetByIdError extends ProductErrorState {
  const ProductGetByIdError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

// --------------------- Create Product States ---------------------
class ProductCreateInitial extends ProductState {
  const ProductCreateInitial();
}

class ProductCreateLoading extends ProductState {
  const ProductCreateLoading();
}

class ProductCreateSuccess extends ProductSuccessState {
  final Product? product;

  const ProductCreateSuccess({
    this.product,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductCreateError extends ProductErrorState {
  const ProductCreateError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

// --------------------- Update Product States ---------------------
class ProductUpdateInitial extends ProductState {
  const ProductUpdateInitial();
}

class ProductUpdateLoading extends ProductState {
  const ProductUpdateLoading();
}

class ProductUpdateSuccess extends ProductSuccessState {
  final Product? product;

  const ProductUpdateSuccess({
    this.product,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductUpdateError extends ProductErrorState {
  const ProductUpdateError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

// --------------------- Delete Product States ---------------------
class ProductDeleteInitial extends ProductState {
  const ProductDeleteInitial();
}

class ProductDeleteLoading extends ProductState {
  const ProductDeleteLoading();
}

class ProductDeleteSuccess extends ProductSuccessState {
  const ProductDeleteSuccess({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductDeleteError extends ProductErrorState {
  const ProductDeleteError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

// --------------------- Pagination States ---------------------
class ProductPaginationLoading extends ProductState {
  const ProductPaginationLoading();
}

class ProductPaginationSuccess extends ProductPagedSuccess {
  const ProductPaginationSuccess({
    required super.products,
    required super.totalPages,
    required super.currentPage,
    required super.hasMorePages,
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}

class ProductPaginationError extends ProductErrorState {
  const ProductPaginationError({
    required super.message,
    required super.statusCode,
    required super.successful,
    required super.rawData,
  });
}
