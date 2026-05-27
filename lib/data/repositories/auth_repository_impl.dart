import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/mappers/user_mapper.dart';

import '../../domain/models/user_dto.dart';
import '../../domain/repositories/auth_repository.dart';

/// Назначение: методы авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthRepositoryImpl implements AuthRepository {
  final ApiDataSource _apiDataSource;

  AuthRepositoryImpl({required ApiDataSource apiDataSource})
    : _apiDataSource = apiDataSource;

  /// авторизация
  /// [identity] - почта пользователя,
  /// [password] - пароль пользователя,
  /// возвращает [AuthEntity]
  @override
  Future<AuthEntity> login({
    required String identity,
    required String password,
  }) async {
    final response = await _apiDataSource.login(
      identity: identity,
      password: password,
    );
    return response.toEntity();
  }
}
