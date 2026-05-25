/// Назначение: модель авторизованного пользователя
/// Дата создания: 25.05.2026
/// Создал: Захар
class UserAuthEntity {
  UserAuthEntity({required this.record, required this.token});

  UserEntity record;
  String token;
}

/// Назначение: модель пользователя
/// Дата создания: 25.05.2026
/// Создал: Захар
class UserEntity {
  final String? lastLoginAt;
  final String role;
  final bool isActive;
  final DateTime created;
  final bool verified;
  final String? lastName;
  final String? avatar;
  final bool emailVisibility;
  final String? middleName;
  final String? aboutMe;
  final String phone;
  final String name;
  final String id;
  final String? position;
  final String? department;
  final String firstName;
  final DateTime? updated;
  final String? email;

  UserEntity({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.created,
    required this.updated,
    this.lastLoginAt,
    required this.role,
    required this.isActive,
    required this.verified,
    required this.emailVisibility,
    this.middleName,
    this.aboutMe,
    required this.phone,
    required this.id,
    this.position,
    this.department,
    this.email,
  });
}
