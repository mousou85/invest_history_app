import 'package:intl/intl.dart';

class Helpers {
  /// 날짜 포맷
  ///
  /// - [value] : DateTime 객체
  /// - [format] : 날짜 포맷(default: 'yyyy-MM-dd HH:mm:ss').
  ///   - 참고: https://api.flutter.dev/flutter/intl/DateFormat-class.html
  static String dateFormat(
    DateTime value, {
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    return DateFormat(format).format(value);
  }
}
