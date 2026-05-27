import 'package:dio/dio.dart';
/// Назначение: работа с токеном авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthInterceptor extends Interceptor {
  String? _token;

  String? get token => _token;

  /// сохранение токена авторизации, [token] - токен авторизации
  void setToken(String token) {
    _token = token;
  }

  /// очистка токена авторизации
  void clearToken() {
    _token = null;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
