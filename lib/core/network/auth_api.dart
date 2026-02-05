import 'package:dio/dio.dart';

import '../env/app_env.dart';
import '../error/app_exception.dart';
import 'token_pair.dart';

class AuthApi {
  AuthApi({required Dio dio, required AppEnv env})
      : _dio = dio,
        _env = env;

  final Dio _dio;
  final AppEnv _env;

  Future<TokenPair> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      _env.refreshEndpoint,
      data: {'refresh_token': refreshToken},
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return TokenPair.fromJson(data);
    }

    throw const AppException('Invalid refresh token response');
  }
}
