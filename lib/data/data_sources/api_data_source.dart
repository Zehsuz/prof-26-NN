import 'package:logger_helper/logger_helper.dart';
import 'package:net_service/net_service.dart';

import '../models/user_dto.dart';

/// Назначение: вызывает запросы из библиотеки
/// Дата создания: 27.05.2026
/// Создал: Захар
class ApiDataSource with CustomLogger {
  final AuthInterceptor _interceptor;
  final NetHttpClient _client;

  ApiDataSource({
    required AuthInterceptor interceptor,
    required NetHttpClient client,
  }) : _interceptor = interceptor,
       _client = client;

  /// авторизация
  /// [identity] - почта пользователя,
  /// [password] - пароль пользователя,
  /// возвращает [AuthEntity]
  Future<AuthDto> login({
    required String identity,
    required String password,
  }) async {
    logInfo(operation: 'login', message: 'Вызов запроса login() из библиотеки');
    final response = await _client.login(
      .new(identity: identity, password: password),
    );
    _interceptor.setToken(response.token);
    logDebug(
      operation: 'login',
      message: 'запрос выполнен успешно, ответ $response',
    );
    return .fromJson(response);
  }
}
