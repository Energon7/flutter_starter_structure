class AppException implements Exception {
  const AppException(this.message, {this.code});

  final String message;
  final String? code;

  @override
  String toString() => 'AppException(message: $message, code: $code)';
}

class NetworkException extends AppException {
  const NetworkException([String message = 'No internet connection'])
      : super(message);
}

class TimeoutException extends AppException {
  const TimeoutException([String message = 'Request timed out'])
      : super(message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String message = 'Unauthorized'])
      : super(message);
}

class NotFoundException extends AppException {
  const NotFoundException([String message = 'Not found']) : super(message);
}

class ServerException extends AppException {
  const ServerException([String message = 'Server error']) : super(message);
}

class UnknownException extends AppException {
  const UnknownException([String message = 'Unknown error']) : super(message);
}
