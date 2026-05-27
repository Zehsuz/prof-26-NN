import 'package:net_service/net_service.dart';

import '../models/user_dto.dart';

/// Назначение: вызывает запросы из библиотеки
/// Дата создания: 27.05.2026
/// Создал: Захар
class ApiDataSource {
  final AuthInterceptor interceptor;
  final NetHttpClient _client;

  ApiDataSource({required this.interceptor, required NetHttpClient client})
    : _client = client;

  /// авторизация
  /// [identity] - почта пользователя,
  /// [password] - пароль пользователя,
  /// возвращает [AuthEntity]
  Future<AuthDto> login({
    required String identity,
    required String password,
  }) async {
    final response = await _client.login(
      .new(identity: identity, password: password),
    );
    return .fromJson(response);
  }
}
