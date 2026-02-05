import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  AppEnv({
    required this.baseUrl,
    required this.refreshEndpoint,
    required this.connectTimeoutMs,
    required this.receiveTimeoutMs,
    required this.enableHttpLogs,
  });

  final String baseUrl;
  final String refreshEndpoint;
  final int connectTimeoutMs;
  final int receiveTimeoutMs;
  final bool enableHttpLogs;

  factory AppEnv.fromEnv() {
    return AppEnv(
      baseUrl: dotenv.env['API_BASE_URL'] ?? 'https://api.example.com',
      refreshEndpoint: dotenv.env['REFRESH_ENDPOINT'] ?? '/auth/refresh',
      connectTimeoutMs:
          int.tryParse(dotenv.env['CONNECT_TIMEOUT_MS'] ?? '') ?? 15000,
      receiveTimeoutMs:
          int.tryParse(dotenv.env['RECEIVE_TIMEOUT_MS'] ?? '') ?? 15000,
      enableHttpLogs:
          (dotenv.env['ENABLE_HTTP_LOGS'] ?? 'true').toLowerCase() == 'true',
    );
  }
}
