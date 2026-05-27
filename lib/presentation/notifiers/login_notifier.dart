import 'package:application/domain/models/user_dto.dart';
import 'package:application/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:logger_helper/logger_helper.dart';

/// Назначение: определяет состояния LoginPage
/// Дата создания: 27.05.2026
/// Создал: Захар
sealed class LoginPageState {
  const LoginPageState();
}

/// Назначение: определяет состояния LoginPageIdle
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginPageIdle extends LoginPageState {
  const LoginPageIdle();
}

/// Назначение: определяет состояния LoginPageFailure
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginPageFailure extends LoginPageState {
  final String message;

  const LoginPageFailure({required this.message});
}

/// Назначение: определяет состояния LoginPageLoading
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginPageLoading extends LoginPageState {
  const LoginPageLoading();
}

/// Назначение: определяет состояния LoginPageLoaded
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginPageLoaded extends LoginPageState {
  final AuthEntity user;

  const LoginPageLoaded({required this.user});
}

/// Назначение: методы экрана Login
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginNotifier extends ValueNotifier<LoginPageState> with CustomLogger {
  final LoginUseCase _loginUseCase;

  LoginNotifier({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const LoginPageIdle());

  Future<void> login({
    required String identity,
    required String password,
  }) async {
    try {
      value = LoginPageLoading();
      logInfo(
        operation: 'login',
        message: 'Начало выполнения запроса login для $identity',
      );
      final user = await _loginUseCase.call(
        identity: identity,
        password: password,
      );
      value = LoginPageLoaded(user: user);
    } catch (e) {
      logError(operation: 'login()', message: e.toString());
      value = LoginPageFailure(message: e.toString());
    }
  }
}
