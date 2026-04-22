import 'package:flutter/material.dart';
import 'package:logger_helper/logger_helper.dart';

///назначение: mixin отвечает за автоматическое логирование жизненного цикла виджета
///дата создания: 22-04-26
///создал Захар
mixin LoggableWidgetState<T extends StatefulWidget> on State<T>
    implements CustomLogger {
  @override
  void activate() {
    _log(message: 'activate()');
    super.activate();
  }

  @override
  void initState() {
    _log(message: 'initState()');
    super.initState();
  }

  @override
  void dispose() {
    _log(message: 'dispose()');
    super.dispose();
  }

  @override
  void deactivate() {
    _log(message: 'deactivate()');
    super.deactivate();
  }

  void _log({required String message}) {
    logInfo(operation: 'Жизненный цикл виджета', message: message);
  }
}
