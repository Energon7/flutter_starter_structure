import 'package:shared_preferences/shared_preferences.dart';

import '../network/token_pair.dart';

class TokenStorage {
  TokenStorage(this._prefs);

  final SharedPreferences _prefs;

  static const String _accessKey = 'access_token';
  static const String _refreshKey = 'refresh_token';

  String? get accessToken => _prefs.getString(_accessKey);
  String? get refreshToken => _prefs.getString(_refreshKey);

  Future<void> save(TokenPair tokens) async {
    await _prefs.setString(_accessKey, tokens.accessToken);
    await _prefs.setString(_refreshKey, tokens.refreshToken);
  }

  Future<void> clear() async {
    await _prefs.remove(_accessKey);
    await _prefs.remove(_refreshKey);
  }
}
