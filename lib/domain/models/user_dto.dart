/// Назначение: модель пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
class UserEntity {
  final String name;
  final String? email;
  final DateTime created;
  final DateTime updated;

  UserEntity({
    required this.name,
    required this.email,
    required this.created,
    required this.updated,
  });
}

/// Назначение: модель авторизованного пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthEntity {
  final UserEntity record;
  final String token;

  AuthEntity({required this.record, required this.token});
}
