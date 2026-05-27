import '../models/user_entity.dart';

/// Назначение: определяет методы авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
abstract interface class AuthRepository {
  /// авторизация
  /// [identity] - почта пользователя,
  /// [password] - пароль пользователя,
  /// возвращает [AuthEntity]
  Future<AuthEntity> login({
    required String identity,
    required String password,
  });
}
