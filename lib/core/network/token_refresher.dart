import 'dart:async';

import '../error/error_handler.dart';
import '../services/token_storage.dart';
import 'auth_api.dart';
import 'token_pair.dart';

class TokenRefresher {
  TokenRefresher({required TokenStorage storage, required AuthApi authApi})
      : _storage = storage,
        _authApi = authApi;

  final TokenStorage _storage;
  final AuthApi _authApi;

  Completer<TokenPair?>? _completer;

  Future<TokenPair?> refresh() {
    if (_completer != null) {
      return _completer!.future;
    }

    _completer = Completer<TokenPair?>();
    _refreshInternal();
    return _completer!.future;
  }

  Future<void> _refreshInternal() async {
    try {
      final refreshToken = _storage.refreshToken;
      if (refreshToken == null || refreshToken.isEmpty) {
        _complete(null);
        return;
      }

      final tokens = await _authApi.refreshToken(refreshToken);
      await _storage.save(tokens);
      _complete(tokens);
    } catch (error, stack) {
      ErrorReporter.record(error, stack);
      await _storage.clear();
      _complete(null);
    }
  }

  void _complete(TokenPair? tokens) {
    _completer?.complete(tokens);
    _completer = null;
  }
}
