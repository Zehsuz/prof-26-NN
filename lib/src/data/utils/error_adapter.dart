import 'package:dio/dio.dart';
import 'package:net_service/net_service.dart';
import 'package:retrofit/call_adapter.dart';

/// Назначение: выбрасывает ошибку в читаемом виде
/// Дата создания: 27.05.2026
/// Создал: Захар
class ErrorAdapter<T> extends CallAdapter<Future<T>, Future<T>> {
  @override
  Future<T> adapt(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      final error = e.response?.data;
      final message = e.message ?? 'error';
      throw NetLibException(operation: 'API Call', message: message, cause: e);
    }
  }
}
