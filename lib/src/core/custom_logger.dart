import 'package:logging/logging.dart';

///назначение: mixin отвечает за добавление методов логирования в любые классы
///дата создания: 22-04-26
///создал Захар
mixin CustomLogger {
  late Logger _logger = Logger('[${runtimeType.toString()}]');

  //функция логирования уровня инфо принимает операцию и сообщение
  void logInfo({required String operation, required String message}) {
    _log(message, operation: operation, level: .INFO);
  }

  //функция логирования уровня дебаг принимает операцию и сообщение
  void logDebug({required String operation, required String message}) {
    _log(message, operation: operation, level: .FINE);
  }

  //функция логирования уровня эррор принимает операцию и сообщение
  void logError({required String operation, required String message}) {
    _log(message, operation: operation, level: .SEVERE);
  }

  void _log(String message, {required String operation, required Level level}) {
    _logger.log(level, '$operation - $message');
  }
}
