import 'package:flutter/material.dart';

/// Назначение: определение цветов приложения
/// Дата создания: 27.05.2026
/// Создал: 15
abstract class Palette {
  abstract final Color primary;
  abstract final Color secondary;
  abstract final Color tertiary;
  abstract final Color error;
  abstract final Color white;
  abstract final Color black;
  abstract final Color darkenWhite;
}
/// Назначение: цвета светлой темы
/// Дата создания: 27.05.2026
/// Создал: 15
class LightPalette extends Palette {
  @override
  Color get primary => .fromRGBO(0, 74, 198, 1);

  @override
  Color get secondary => .fromRGBO(80, 95, 118, 1);

  @override
  Color get tertiary => .fromRGBO(148, 55, 0, 1);

  @override
  Color get error => .fromRGBO(186, 26, 26, 1);

  @override
  Color get white => .fromRGBO(255, 255, 255, 1);

  @override
  Color get black => .fromRGBO(25, 27, 35, 1);

  @override
  Color get darkenWhite => .fromRGBO(250, 248, 255, 1);
}
