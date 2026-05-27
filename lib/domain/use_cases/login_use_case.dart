import 'package:application/domain/exceptions/exception.dart';
import 'package:application/domain/repositories/auth_repository.dart';
import 'package:logger_helper/logger_helper.dart';

import '../models/user_dto.dart';

/// Назначение: сценарий авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginUseCase with CustomLogger {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  /// авторизация [AuthRequest] - модель авторизации, возвращает [AuthEntity]
  Future<AuthEntity> call({
    required String identity,
    required String password,
  }) async {
    try {
      final response = await _authRepository.login(
        identity: identity,
        password: password,
      );
      return response;
    } on Exception catch (e) {
      logError(operation: 'login', message: e.toString());
      throw AuthDomainExceptions(
        operation: 'request',
        message: 'login()',
        cause: e,
      );
    }
  }
}
