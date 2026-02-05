import 'package:dio/dio.dart';

import 'app_exception.dart';

class ErrorMapper {
  static AppException map(Object error) {
    if (error is AppException) {
      return error;
    }

    if (error is DioException) {
      return _mapDioError(error);
    }

    return const UnknownException();
  }

  static AppException _mapDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutException();
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        return _mapBadResponse(error.response?.statusCode);
      case DioExceptionType.cancel:
        return const AppException('Request cancelled');
      case DioExceptionType.badCertificate:
        return const AppException('Bad certificate');
      case DioExceptionType.unknown:
        return const UnknownException();
    }
  }

  static AppException _mapBadResponse(int? statusCode) {
    if (statusCode == null) {
      return const UnknownException();
    }

    if (statusCode == 401 || statusCode == 403) {
      return const UnauthorizedException();
    }

    if (statusCode == 404) {
      return const NotFoundException();
    }

    if (statusCode >= 500) {
      return const ServerException();
    }

    return AppException('Unexpected error: $statusCode');
  }
}
