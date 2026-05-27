import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Назначение: модель ответа от сервера
/// Дата создания: 27.05.2026
/// Создал: Захар
@JsonSerializable()
class UserResponse {
  final String name;
  final String? email;
  final DateTime created;
  final DateTime updated;

  UserResponse({
    required this.name,
    required this.email,
    required this.created,
    required this.updated,
  });

  /// метод десериализации ответа с сервера в модель, [Map] - ответ от сервера, возвращает [UserResponse]
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  /// метод сериализации модели в словарь формата json, возвращает [Map]
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

/// Назначение: модель авторизованного пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
@JsonSerializable()
class AuthResponse {
  final UserResponse record;
  final String token;

  AuthResponse({required this.record, required this.token});

  /// метод десериализации ответа с сервера в модель, [Map] - ответ от сервера, возвращает [AuthResponse]

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  /// метод сериализации модели в словарь формата json, возвращает [Map]
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

/// Назначение: модель авторизации пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
@JsonSerializable()
class AuthRequest {
  final String identity;
  final String password;

  AuthRequest({required this.identity, required this.password});

  /// метод десериализации ответа с сервера в модель, [Map] - ответ от сервера, возвращает [AuthRequest]

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  /// метод сериализации модели в словарь формата json, возвращает [Map]
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
