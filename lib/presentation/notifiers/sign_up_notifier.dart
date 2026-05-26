import 'package:application/domain/models/user.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/signup_use_case.dart';

/// Назначение: определения состояний экрана SignUpPage
/// Дата создания: 25.05.2026
/// Создал: Захар
sealed class SignUpPageState {
  const SignUpPageState();
}

/// Назначение: состояниe экрана SignUpPageIdle
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpPageIdle extends SignUpPageState {
  const SignUpPageIdle();
}

/// Назначение: состояниe экрана SignUpPageLoading
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpPageLoading extends SignUpPageState {
  const SignUpPageLoading();
}

/// Назначение: состояниe экрана SignUpPageLoaded
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpPageLoaded extends SignUpPageState {
  final UserEntity userEntity;

  const SignUpPageLoaded({required this.userEntity});
}

/// Назначение: состояниe экрана SignUpPageFailure
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpPageFailure extends SignUpPageState {
  final String message;

  const SignUpPageFailure({required this.message});
}

/// Назначение: методы экрана SignUpPage
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpNotifier extends ValueNotifier<SignUpPageState> {
  final SignUpUseCase _signUpUseCase;

  SignUpNotifier({required this._signUpUseCase})
    : super(const SignUpPageIdle());

  /// регистрация полльзователя, принимает [email],[password],[passwordConfirm],[name],[firstName],[lastName],[middleName],[phone],[role],[isActive], возвращает [UserEntity]
  Future<void> signup({
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
      value = SignUpPageLoading();
      final user = await _signUpUseCase.call(
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
      value = SignUpPageLoaded(userEntity: user);
    } catch (e) {
      value = SignUpPageFailure(message: e.toString());
    }
  }
}
