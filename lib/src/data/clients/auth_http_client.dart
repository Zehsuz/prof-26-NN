import 'package:net_service/net_service.dart';
/// Назначение: определяет методы авторизации
/// Дата создания: 26.05.2026
/// Создал: Захар
abstract interface class AuthHttpClient {
  /// авторизация [AuthRequest] - модель авторизации, возвращает [AuthResponse]
  Future<AuthResponse> login(AuthRequest request);
}
