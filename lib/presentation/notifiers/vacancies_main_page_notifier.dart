import 'package:application/domain/models/user.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/signup_use_case.dart';

/// Назначение: определения состояний экрана VacanciesMainPage
/// Дата создания: 25.05.2026
/// Создал: Захар
sealed class VacanciesMainPageState {
  const VacanciesMainPageState();
}

/// Назначение: состояниe экрана VacanciesMainPageIdle
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPageIdle extends VacanciesMainPageState {
  const VacanciesMainPageIdle();
}

/// Назначение: состояниe экрана VacanciesMainPageLoading
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPageLoading extends VacanciesMainPageState {
  const VacanciesMainPageLoading();
}

/// Назначение: состояниe экрана VacanciesMainPageLoaded
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPageLoaded extends VacanciesMainPageState {
  final UserEntity userEntity;

  const VacanciesMainPageLoaded({required this.userEntity});
}

/// Назначение: состояниe экрана VacanciesMainPageFailure
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPageFailure extends VacanciesMainPageState {
  final String message;

  const VacanciesMainPageFailure({required this.message});
}

/// Назначение: методы экрана VacanciesMainPage
/// Дата создания: 25.05.2026
/// Создал: Захар
class VacanciesMainPageNotifier extends ValueNotifier<VacanciesMainPageState> {
  final SignUpUseCase _signUpUseCase;

  VacanciesMainPageNotifier({required this._signUpUseCase})
    : super(const VacanciesMainPageIdle());
}
