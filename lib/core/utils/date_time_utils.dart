import 'package:intl/intl.dart';

class DatePatterns {
  static const String isoDate = 'yyyy-MM-dd';
  static const String dayMonthYear = 'dd.MM.yyyy';
  static const String monthNameDay = 'MMMM d';
  static const String monthYear = 'MMMM yyyy';
  static const String time24 = 'HH:mm';
  static const String dateTime = 'dd.MM.yyyy HH:mm';
  static const String fullDateTime = 'EEEE, dd MMMM yyyy HH:mm';
}

class DateTimeUtils {
  static String format(
    DateTime date, {
    String pattern = DatePatterns.isoDate,
    String? locale,
  }) {
    return DateFormat(pattern, locale).format(date);
  }

  static String formatShortDate(DateTime date, {String? locale}) {
    return DateFormat.yMd(locale).format(date);
  }

  static String formatLongDate(DateTime date, {String? locale}) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  static String formatTime(DateTime date, {String? locale}) {
    return DateFormat.Hm(locale).format(date);
  }

  static String formatDateTime(DateTime date, {String? locale}) {
    return DateFormat.yMd(locale).add_Hm().format(date);
  }

  static DateTime parse(
    String value, {
    required String pattern,
    String? locale,
    bool utc = false,
  }) {
    final formatter = DateFormat(pattern, locale);
    final parsed = formatter.parse(value, utc);
    return utc ? parsed.toUtc() : parsed;
  }

  static DateTime? tryParse(
    String value, {
    required String pattern,
    String? locale,
    bool utc = false,
  }) {
    try {
      return parse(value, pattern: pattern, locale: locale, utc: utc);
    } catch (_) {
      return null;
    }
  }

  static String now({
    String pattern = DatePatterns.isoDate,
    String? locale,
  }) {
    return format(DateTime.now(), pattern: pattern, locale: locale);
  }
}
