import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/mappers/user_mapper.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repository.dart';

/// Назначение: иницилизация методов авторизации
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthRepositoryImpl implements AuthRepository {
  final ApiDataSource _apiDataSource;

  AuthRepositoryImpl({required this._apiDataSource});

  /// авторизация полльзователя, принимает [identity], [password], возвращает [UserAuthEntity]
  @override
  Future<UserAuthEntity> login({
    required String identity,
    required String password,
  }) async {
    final response = await _apiDataSource.login(
      identity: identity,
      password: password,
    );
    return response.toEntity();
  }

  /// регистрация полльзователя, принимает [email],[password],[passwordConfirm],[name],[firstName],[lastName],[middleName],[phone],[role],[isActive], возвращает [UserEntity]
  @override
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
  }) async {
    final response = await _apiDataSource.signup(
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      name: name,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      phone: phone,
      role: role,
      isActive: isActive,
    );
    return response.toEntity();
  }
}
