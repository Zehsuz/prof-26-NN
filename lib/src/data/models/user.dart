import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Назначение: модель ответа от сервера
/// Дата создания: 27.05.2026
/// Создал: Захар
@JsonSerializable()
class UserResponse {
  final String name;
  final String firstName;
  final String lastName;
  final String role;
  final String? avatarUrl;
  final String email;

  UserResponse({
    required this.name,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.avatarUrl,
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
  final UserResponse user;
  final String token;
  AuthResponse({required this.user, required this.token});

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
  final String email;
  final String password;

  AuthRequest({required this.email, required this.password});

  /// метод десериализации ответа с сервера в модель, [Map] - ответ от сервера, возвращает [AuthRequest]

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  /// метод сериализации модели в словарь формата json, возвращает [Map]
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}

/// Назначение: модель авторизации пользователя
/// Дата создания: 27.05.2026
/// Создал: Захар
@JsonSerializable()
class UserRegRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  UserRegRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  /// метод десериализации ответа с сервера в модель, [Map] - ответ от сервера, возвращает [AuthRequest]

  factory UserRegRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegRequestFromJson(json);

  /// метод сериализации модели в словарь формата json, возвращает [Map]
  Map<String, dynamic> toJson() => _$UserRegRequestToJson(this);
}
