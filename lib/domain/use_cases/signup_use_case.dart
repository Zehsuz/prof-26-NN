import 'package:application/domain/exceptions/exception.dart';
import 'package:application/domain/repositories/auth_repository.dart';

import '../models/user.dart';

/// Назначение: сценарий авторизации
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({required this._authRepository});

  /// регистрация пользователя
  /// email почта
  /// password пароль
  /// passwordConfirm повторение пароля
  /// name имя пользователя
  /// firstName имя
  /// lastName фамилия
  /// middleName отчество
  /// phone телефон
  /// role роль
  /// isActive активность
  /// возвращает UserEntity
  Future<UserEntity> call({
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
    try {
      final response = await _authRepository.signup(
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
      return response;
    } on Exception catch (e) {
      throw AuthDomainException(
        message: 'signup',
        operation: 'domain request',
        cause: e,
      );
    }
  }
}
