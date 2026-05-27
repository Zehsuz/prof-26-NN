import 'package:application/data/models/user_dto.dart';
import 'package:application/domain/models/user_dto.dart';

/// Назначение: добавляет метод [toEntity] к [UserDto]
/// Дата создания: 27.05.2026
/// Создал: Захар
extension UserMapper on UserDto {
  /// метод десериализации [UserDto] в [UserEntity],
  /// возвращает [UserEntity]
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      firstName: firstName,
      lastName: lastName,
      email: email,
      created: created,
      updated: updated,
    );
  }
}
/// Назначение: добавляет метод [toEntity] к [AuthDto]
/// Дата создания: 27.05.2026
/// Создал: Захар
extension AuthMapper on AuthDto {
  /// метод десериализации [AuthDto] в [AuthEntity],
  /// возвращает [AuthEntity]
  AuthEntity toEntity() {
    return AuthEntity(record: record.toEntity(), token: token);
  }
}
