import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<bool> openUrl(String url) {
    return _launch(Uri.parse(url));
  }

  Future<bool> call(String phoneNumber) {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    return _launch(uri);
  }

  Future<bool> sendEmail({
    required String to,
    String? subject,
    String? body,
    List<String>? cc,
    List<String>? bcc,
  }) {
    final query = <String, String>{};
    if (subject != null && subject.isNotEmpty) {
      query['subject'] = subject;
    }
    if (body != null && body.isNotEmpty) {
      query['body'] = body;
    }
    if (cc != null && cc.isNotEmpty) {
      query['cc'] = cc.join(',');
    }
    if (bcc != null && bcc.isNotEmpty) {
      query['bcc'] = bcc.join(',');
    }

    final uri = Uri(
      scheme: 'mailto',
      path: to,
      query: query.isEmpty ? null : Uri(queryParameters: query).query,
    );
    return _launch(uri);
  }

  Future<bool> openMapWithQuery(String query) {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );
    return _launch(uri);
  }

  Future<bool> openMapWithCoordinates({
    required double latitude,
    required double longitude,
    String? label,
  }) {
    final query = label == null || label.isEmpty
        ? '$latitude,$longitude'
        : '$latitude,$longitude(${Uri.encodeComponent(label)})';
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$query',
    );
    return _launch(uri);
  }

  Future<bool> openWhatsApp({
    required String phoneNumber,
    String? message,
  }) {
    final query = <String, String>{};
    if (message != null && message.isNotEmpty) {
      query['text'] = message;
    }
    final uri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
      queryParameters: query.isEmpty ? null : query,
    );
    return _launch(uri);
  }

  Future<bool> _launch(Uri uri) async {
    if (!await canLaunchUrl(uri)) {
      return false;
    }
    return launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
