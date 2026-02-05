class TokenPair {
  const TokenPair({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;

  factory TokenPair.fromJson(Map<String, dynamic> json) {
    final access = json['access_token'] ?? json['accessToken'];
    final refresh = json['refresh_token'] ?? json['refreshToken'];

    if (access is! String || refresh is! String) {
      throw const FormatException('Invalid token response');
    }

    return TokenPair(accessToken: access, refreshToken: refresh);
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
