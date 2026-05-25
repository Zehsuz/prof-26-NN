import 'package:application/domain/models/user.dart';

/// Назначение: определение методов авторизации
/// Дата создания: 25.05.2026
/// Создал: Захар
abstract interface class AuthRepository {
  /// авторизация полльзователя, принимает [identity], [password], возвращает [UserAuthEntity]
  Future<UserAuthEntity> login({
    required String identity,
    required String password,
  });

  /// регистрация полльзователя, принимает [email],[password],[passwordConfirm],[name],[firstName],[lastName],[middleName],[phone],[role],[isActive], возвращает [UserEntity]
  Future<UserEntity> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String firstName,
    required String lastName,
    required String middleName,
    required String phone,
    required String role,
    required bool isActive,
  });
}
