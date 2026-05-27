import 'package:logging/logging.dart';

/// Назначение: логирование приложения
/// Дата создания: 27.05.2026
/// Создал: 15
mixin CustomLogger {
  late Logger _logger = Logger(runtimeType.toString());

  /// логирование уровня INFO,
  /// [operation] - операция,
  /// [message] - сообщение,
  /// [rtype] - тип
  void logInfo({
    required String operation,
    required String message,
    String? rtype,
  }) {
    _log(.INFO, operation: operation, message: message, rtype: rtype);
  }

  /// логирование уровня DEBUG,
  /// [operation] - операция,
  /// [message] - сообщение,
  /// [rtype] - тип
  void logDebug({
    required String operation,
    required String message,
    String? rtype,
  }) {
    _log(.FINE, operation: operation, message: message, rtype: rtype);
  }

  /// логирование уровня ERROR,
  /// [operation] - операция,
  /// [message] - сообщение,
  /// [rtype] - тип
  void logError({
    required String operation,
    required String message,
    String? rtype,
  }) {
    _log(.SEVERE, operation: operation, message: message, rtype: rtype);
  }

  void _log(
    Level level, {
    required String operation,
    required String message,
    required String? rtype,
  }) {
    _logger.log(
      level,
      '${level == .FINE
          ? 'DEBUG'
          : level == .SEVERE
          ? 'ERROR'
          : 'INFO'} [${rtype ?? runtimeType}]: $operation - $message',
    );
  }
}
