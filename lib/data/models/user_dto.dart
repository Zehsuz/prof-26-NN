import 'package:net_service/net_service.dart';

/// Назначение: модель пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
class UserDto {
  final String name;
  final String? email;
  final DateTime created;
  final DateTime updated;

  UserDto({
    required this.name,
    required this.email,
    required this.created,
    required this.updated,
  });

  /// сериализует модель из библиотеки в модель DTO,
  /// [UserResponse] - модель из библиотеки,
  /// возвращает [UserDto]
  factory UserDto.fromJson(UserResponse response) {
    return UserDto(
      name: response.name,
      email: response.email,
      created: response.created,
      updated: response.updated,
    );
  }
}

/// Назначение: модель авторизованного пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthDto {
  final UserDto record;
  final String token;

  AuthDto({required this.record, required this.token});

  /// сериализует модель из библиотеки в модель DTO,
  /// [AuthResponse] - модель из библиотеки,
  /// возвращает [AuthDto]
  factory AuthDto.fromJson(AuthResponse response) {
    return AuthDto(record: .fromJson(response.record), token: response.token);
  }
}
