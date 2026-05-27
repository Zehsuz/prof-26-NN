import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/mappers/user_mapper.dart';
import 'package:logger_helper/logger_helper.dart';

import '../../domain/models/user_dto.dart';
import '../../domain/repositories/auth_repository.dart';

/// Назначение: методы авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthRepositoryImpl with CustomLogger implements AuthRepository {
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
    logInfo(
      operation: 'login',
      message: 'начало вызова запроса из api_data_source',
    );
    final response = await _apiDataSource.login(
      identity: identity,
      password: password,
    );
    logDebug(
      operation: 'login',
      message:
          'Запрос login выполнен успешно ответ из api_data_source $response',
    );
    return response.toEntity();
  }
}
