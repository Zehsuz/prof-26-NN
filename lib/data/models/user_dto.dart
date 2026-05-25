import 'package:net_service/net_service.dart';

/// Назначение: модель AuthDto
/// Дата создания: 25.05.26
/// Создал: Захар
class UserAuthDto {
  UserAuthDto({required this.record, required this.token});

  UserDto record;
  String token;

  /// метод десериализации модели, принимает [UserAuthResponse], возвращает [UserAuthDto]
  ///
  /// [UserAuthResponse] - десериализованная модель из библиотеки
  ///
  /// [UserAuthDto] - модель авторизации пользователя
  factory UserAuthDto.fromResponse(AuthResponse response) => UserAuthDto(
    record: UserDto.fromResponse(response.record),
    token: response.token,
  );
}

/// Назначение: модель UserDto
/// Дата создания: 25.05.26
/// Создал: Захар
class UserDto {
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

  UserDto({
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

  /// метод десериализации модели, принимает [UserAuthResponse], возвращает [UserAuthDto]
  ///
  /// [UserAuthResponse] - десериализованная модель из библиотеки
  ///
  /// [UserAuthDto] - модель авторизации пользователя
  factory UserDto.fromResponse(UserResponse response) {
    return UserDto(
      name: response.name,
      firstName: response.firstName,
      lastName: response.lastName,
      avatar: response.avatar,
      created: response.created,
      updated: response.updated,
      role: response.role,
      isActive: response.isActive,
      verified: response.verified,
      emailVisibility: response.emailVisibility,
      phone: response.phone,
      id: response.id,
    );
  }
}
