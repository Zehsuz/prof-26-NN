import 'package:flutter/material.dart';
import 'package:ui_kit/src/presentation/theme/palette.dart';

/// Назначение: определение темы приложения
/// Дата создания: 27.05.2026
/// Создал: 15
class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;

  CustomTheme({required this.palette});

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    return this;
  }

  /// функция вызова нужной темы приложения [context] - окружение приложения
  static CustomTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTheme>()!;
}

/// Назначение: добавляет цвета и типографику в тему приложения
/// Дата создания: 27.05.2026
/// Создал: 15
extension ThemeExt on BuildContext {
  Palette get palette => CustomTheme.of(this).palette;
}
