import 'package:dio/dio.dart';
import 'package:logger_helper/logger_helper.dart';

/// Назначение: автоматическое логирование запросов
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoggingInterceptor extends Interceptor with CustomLogger {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final operation = '${options.method} ${options.uri.pathSegments.join('/')}';
    logInfo(
      operation: operation,
      message: 'Начало выполнения запроса $operation',
      rtype: 'NetHttpClient',
    );
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final operation =
        '${response.requestOptions.method} ${response.requestOptions.uri.pathSegments.join('/')}';
    logInfo(
      operation: operation,
      message:
          'Запрос $operation выполнен успешно! Ответ от сервера: ${response.data}',
      rtype: 'NetHttpClient',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final operation =
        '${err.requestOptions.method} ${err.requestOptions.uri.pathSegments.join('/')}';
    logInfo(
      operation: operation,
      message:
          'NetLibException: возникла ошибка выполнения запроса $operation. Ошибка $err',
      rtype: 'NetHttpClient',
    );
    handler.next(err);
  }
}
