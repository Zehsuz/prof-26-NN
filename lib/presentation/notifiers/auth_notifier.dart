import 'package:application/domain/models/user.dart';
import 'package:application/domain/use_cases/auth_use_case.dart';
import 'package:flutter/material.dart';

/// Назначение: определения состояний экрана AuthPage
/// Дата создания: 25.05.2026
/// Создал: Захар
sealed class AuthPageState {
  const AuthPageState();
}

/// Назначение: состояниe экрана AuthPageIdle
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthPageIdle extends AuthPageState {
  const AuthPageIdle();
}

/// Назначение: состояниe экрана AuthPageLoading
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthPageLoading extends AuthPageState {
  const AuthPageLoading();
}

/// Назначение: состояниe экрана AuthPageLoaded
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthPageLoaded extends AuthPageState {
  final UserEntity userEntity;

  const AuthPageLoaded({required this.userEntity});
}

/// Назначение: состояниe экрана AuthPageFailure
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthPageFailure extends AuthPageState {
  final String message;

  const AuthPageFailure({required this.message});
}

/// Назначение: методы экрана AuthPage
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthNotifier extends ValueNotifier<AuthPageState> {
  final AuthUseCase _authUseCase;

  AuthNotifier({required this._authUseCase})
    : super(const AuthPageIdle());

  /// вызывает сценарий авторизации полльзователя, принимает [identity], [password]
  Future<void> login({
    required String identity,
    required String password,
  }) async {
    try {
      value = AuthPageLoading();
      final user = await _authUseCase.call(
        identity: identity,
        password: password,
      );
      value = AuthPageLoaded(userEntity: user.record);
    } catch (e) {
      value = AuthPageFailure(message: e.toString());
    }
  }
}
