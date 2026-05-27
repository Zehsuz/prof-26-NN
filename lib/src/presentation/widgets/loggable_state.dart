import 'package:flutter/material.dart';
import 'package:logger_helper/logger_helper.dart';

/// Назначение: автоматическое логирование ЖЦ виджета
/// Дата создания: 27.05.2026
/// Создал: 15
mixin LoggableState<T extends StatefulWidget> on State<T>
    implements CustomLogger {
  @override
  void initState() {
    _log('initState()');
    super.initState();
  }

  @override
  void activate() {
    _log('activate()');
    super.activate();
  }

  @override
  void deactivate() {
    _log('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    _log('dispose()');
    super.dispose();
  }

  /// функция логирования ЖЦ build
  void logBuild() {
    _log('build()');
  }

  void _log(String message) {
    logInfo(operation: 'Life Cycle', message: message);
  }
}
