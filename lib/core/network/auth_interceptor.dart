import 'package:dio/dio.dart';

import '../services/token_storage.dart';
import 'token_refresher.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required Dio dio,
    required TokenStorage storage,
    required TokenRefresher refresher,
  })  : _dio = dio,
        _storage = storage,
        _refresher = refresher;

  final Dio _dio;
  final TokenStorage _storage;
  final TokenRefresher _refresher;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _storage.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final isUnauthorized = statusCode == 401 || statusCode == 403;
    final isRetry = err.requestOptions.extra['retry'] == true;

    if (!isUnauthorized || isRetry) {
      handler.next(err);
      return;
    }

    final tokens = await _refresher.refresh();
    if (tokens == null) {
      handler.next(err);
      return;
    }

    final requestOptions = err.requestOptions;
    requestOptions.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    requestOptions.extra['retry'] = true;

    try {
      final response = await _dio.fetch(requestOptions);
      handler.resolve(response);
    } catch (_) {
      handler.next(err);
    }
  }
}
