import 'package:application/domain/exceptions/exception.dart';
import 'package:application/domain/repositories/auth_repository.dart';

import '../models/user_entity.dart';
/// Назначение: сценарий авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  /// авторизация [AuthRequest] - модель авторизации, возвращает [AuthEntity]
  Future<AuthEntity> login({
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
      throw AuthDomainExceptions(
        operation: 'request',
        message: 'login()',
        cause: e,
      );
    }
  }
}
