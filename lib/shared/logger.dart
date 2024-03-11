import 'dart:convert';
import 'dart:math';

import 'package:logger/logger.dart';

Logger getLogger({
  String? label,
  bool printTime = true,
  bool colors = true,
  int? errorMethodCount = 8,
}) {
  return Logger(
    printer: _CustomPrinter(
      prefixLabel: label,
      printTime: printTime,
      colors: colors,
      errorMethodCount: errorMethodCount,
    ),
  );
}

class _CustomPrinter extends SimplePrinter {
  static final levelPrefixes = {
    Level.trace: '[TRACE]',
    Level.debug: '[DEBUG]',
    Level.info: '[INFO]',
    Level.warning: '[WARN]',
    Level.error: '[ERR]',
    Level.fatal: '[FATAL]',
  };

  static const prefixLabelColor = AnsiColor.fg(10);

  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.fg(13),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  static final _deviceStackTraceRegex = RegExp(r'#[0-9]+\s+(.+) \((\S+)\)');

  final String? prefixLabel;

  final int? errorMethodCount;

  _CustomPrinter({
    super.printTime = true,
    super.colors = true,
    this.prefixLabel,
    this.errorMethodCount = 8,
  });

  @override
  List<String> log(LogEvent event) {
    final prefixLabelStr = (prefixLabel != null && prefixLabel!.isNotEmpty)
        ? _prefixLabel(prefixLabel!)
        : '';
    final logLevelStr = _logLevel(event.level);
    final messageStr = _stringifyMessage(event.message);
    final timeStr = printTime ? _getTime(event.time) : '';

    String? errorStr;
    List<String>? errorStacktrace;
    if (event.error != null) {
      errorStr = _errorString(event.error);
      errorStacktrace =
          _formatErrorStackTrace(event.stackTrace ?? StackTrace.current);
    }

    List<String> logStrings = [
      '$prefixLabelStr$logLevelStr$timeStr $messageStr',
      errorStr ?? '',
    ];
    if (errorStacktrace != null) {
      logStrings.addAll(errorStacktrace);
    }

    return logStrings;
  }

  String _logLevel(Level level) {
    final prefix = levelPrefixes[level]!;
    final color = levelColors[level]!;

    return colors ? color(prefix) : prefix;
  }

  String _prefixLabel(String label) {
    final str = '[${label.toUpperCase()}]';
    return colors ? prefixLabelColor(str) : str;
  }

  String _getTime(DateTime time) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String threeDigits(int n) {
      if (n >= 100) return '$n';
      if (n >= 10) return '0$n';
      return '00$n';
    }

    final hour = twoDigits(time.hour);
    final min = twoDigits(time.minute);
    final sec = twoDigits(time.second);
    final ms = threeDigits(time.millisecond);
    return '[$hour:$min:$sec.$ms]';
  }

  String _stringifyMessage(dynamic message) {
    final finalMessage = message is Function ? message() : message;
    if (finalMessage is Map || finalMessage is Iterable) {
      final encoder = JsonEncoder.withIndent(' ', (obj) => obj.toString());
      return encoder.convert(finalMessage);
    } else {
      return finalMessage.toString();
    }
  }

  String? _errorString(Object? error) {
    if (error == null) return null;

    final color = levelColors[Level.error]!;
    return color('  - ERROR: ${error.toString()}');
  }

  List<String>? _formatErrorStackTrace(StackTrace? stackTrace) {
    final color = levelColors[Level.error]!;

    List<String>? lines = stackTrace
        .toString()
        .split('\n')
        .where((line) => !_discardDeviceStacktraceLine(line) && line.isNotEmpty)
        .toList();
    List<String> formatted = [];

    int stackTraceLength = errorMethodCount != null
        ? min(lines.length, errorMethodCount!)
        : lines.length;
    for (int count = 0; count < stackTraceLength; count++) {
      var line = lines[count];
      if (count < 0) {
        continue;
      }
      formatted.add(
          color('  #$count   ${line.replaceFirst(RegExp(r'#\d+\s+'), '')}'));
    }

    if (formatted.isEmpty) {
      return null;
    } else {
      return formatted;
    }
  }

  bool _discardDeviceStacktraceLine(String line) {
    var match = _deviceStackTraceRegex.matchAsPrefix(line);
    if (match == null) {
      return false;
    }
    final segment = match.group(2)!;
    if (segment.startsWith('package:logger')) {
      return true;
    }
    return false;
  }
}
