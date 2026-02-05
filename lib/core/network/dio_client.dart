import 'package:dio/dio.dart';

import '../env/app_env.dart';
import '../services/token_storage.dart';
import 'auth_interceptor.dart';
import 'logging_interceptor.dart';
import 'token_refresher.dart';

class DioClient {
  DioClient({
    required AppEnv env,
    required TokenStorage storage,
    required TokenRefresher refresher,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: env.baseUrl,
            connectTimeout: Duration(milliseconds: env.connectTimeoutMs),
            receiveTimeout: Duration(milliseconds: env.receiveTimeoutMs),
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
        ) {
    _dio.interceptors.add(
      AuthInterceptor(dio: _dio, storage: storage, refresher: refresher),
    );

    if (env.enableHttpLogs) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  final Dio _dio;

  Dio get dio => _dio;
}
