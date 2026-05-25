import 'package:application/domain/exceptions/exception.dart';
import 'package:application/domain/repositories/auth_repository.dart';

import '../models/user.dart';

/// Назначение: сценарий авторизации
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase({required this._authRepository});

  /// авторизация полльзователя, принимает [identity], [password], возвращает [UserAuthEntity]
  Future<UserAuthEntity> call({
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
      throw AuthDomainException(
        message: 'login',
        operation: 'domain request',
        cause: e,
      );
    }
  }
}
