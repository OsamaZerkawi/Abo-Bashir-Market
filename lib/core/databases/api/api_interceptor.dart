// // import 'package:abo_bashir_market/cache/cache_helper.dart';
// // import 'package:abo_bashir_market/core/api/end_points.dart';
// // import 'package:dio/dio.dart';

// // class ApiInterceptor extends Interceptor {
// //   @override
// //   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
// //     // Retrieve token from cache
// //     final token = CacheHelper().getData(key: ApiKey.token);

// //     if (token != null) {
// //       options.headers[ApiKey.Authorization] = 'Bearer $token';
// //     }

// //     super.onRequest(options, handler);
// //   }

// //   @override
// //   void onResponse(Response response, ResponseInterceptorHandler handler) {
// //     super.onResponse(response, handler);
// //   }

// //   @override
// //   void onError(DioException err, ErrorInterceptorHandler handler) async {
// //     if (err.response?.statusCode == 401) {
// //       // If a 401 response is received, refresh the access token
// //       String newAccessToken = await refreshToken();

// //       // Update the request header with the new access token
// //       err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

// //       // Repeat the request with the updated header
// //       return handler.resolve(await );
// //     }
// //     super.onError(err, handler);
// //   }
// // }

// import 'package:abo_bashir_market/cache/cache_helper.dart';
// import 'package:abo_bashir_market/core/api/dio_consumer.dart';
// import 'package:abo_bashir_market/core/api/end_points.dart';
// import 'package:abo_bashir_market/repository/auth_repository.dart';
// import 'package:dio/dio.dart';

// class ApiInterceptor extends Interceptor {
//   final Dio dio;

//   ApiInterceptor(this.dio);

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     final token = CacheHelper().getData(key: ApiKey.token);

//     if (token != null) {
//       options.headers[ApiKey.Authorization] = 'Bearer $token';
//     }

//     super.onRequest(options, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       // Refresh token
//       // String newAccessToken = await refreshToken();
//       final newAccessToken = await AuthRepository(api: DioConsumer(dio: Dio()))
//           .refreshToken(oldToken: CacheHelper().getData(key: ApiKey.token));
//       newAccessToken.fold((errmodel) {
//         return handler.next(err);
//       }, (newAccessToken) async {
//         // Save new token to cache
//         CacheHelper().saveData(key: ApiKey.token, value: newAccessToken);

//         // Update the failed request with the new token
//         final RequestOptions options = err.requestOptions;
//         options.headers[ApiKey.Authorization] = 'Bearer $newAccessToken';

//         // Retry the request
//         final Response retryResponse = await dio.fetch(options);
//         return handler.resolve(retryResponse);
//       });
//     }
//     return super.onError(err, handler);
//   }
// }

// // Future<String> refreshToken() async {
// //   // Perform a request to the refresh token endpoint and return the new access token.

// //   // You can replace this with your own implementation.
// //   return 'your_new_access_token';
// // }

// ApiInterceptor.dart
import 'package:abo_bashir_market/core/databases/cache/cache_helper.dart';
import 'package:abo_bashir_market/core/databases/api/dio_consumer.dart';
import 'package:abo_bashir_market/core/databases/api/end_points.dart';
import 'package:abo_bashir_market/features/register/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final Dio dio;
  bool _isRefreshing = false;
  final List<RequestOptions> _requestsQueue = [];

  ApiInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKey.token);
    if (token != null) {
      options.headers[ApiKey.Authorization] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;

      // Add request to queue
      if (!_isRefreshing) {
        _isRefreshing = true;
        try {
          final newToken = await _refreshToken();
          if (newToken != null) {
            // Retry all queued requests
            for (var req in _requestsQueue) {
              final newReq = req.copyWith(headers: {
                ...req.headers,
                'Authorization': 'Bearer $newToken'
              });
              dio.fetch(newReq);
            }
            // Retry original request
            options.headers[ApiKey.Authorization] = 'Bearer $newToken';
            final response = await dio.fetch(options);
            return handler.resolve(response);
          } else {
            _logoutUser();
          }
        } catch (e) {
          _logoutUser();
        } finally {
          _isRefreshing = false;
          _requestsQueue.clear();
        }
      } else {
        // Add to queue while refreshing
        _requestsQueue.add(options);
        return;
      }
    }
    return super.onError(err, handler);
  }

  Future<String?> _refreshToken() async {
    final oldToken = CacheHelper().getData(key: ApiKey.token);
    if (oldToken == null) {
      _logoutUser();
      return null;
    }

    final result = await AuthRepository(api: DioConsumer(dio: dio))
        .refreshToken(oldToken: oldToken);

    return result.fold(
      (error) {
        _logoutUser();
        return null;
      },
      (newToken) {
        CacheHelper().saveData(key: ApiKey.token, value: newToken);
        return newToken;
      },
    );
  }

  void _logoutUser() {
    CacheHelper().removeData(key: ApiKey.token);
    // Navigate to login screen using your preferred method
    // Example: navigatorKey.currentState?.pushReplacementNamed('/login');
  }
}
