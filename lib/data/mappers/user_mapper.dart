import 'package:application/data/models/user_dto.dart';
import 'package:application/domain/models/user.dart';

/// Назначение: добавление метода toEntity к UserDto
/// Дата создания: 25.05.2026
/// Создал: Захар
extension UserMapper on UserDto {
  /// метод сериализации модели из [UserDto] в [UserEntity], возвращает [UserEntity]
  ///
  /// [UserDto] - модель слоя data
  /// [UserEntity] - модель слоя domain
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      created: created,
      updated: updated,
      lastLoginAt: lastLoginAt,
      role: role,
      isActive: isActive,
      verified: verified,
      emailVisibility: emailVisibility,
      middleName: middleName,
      aboutMe: aboutMe,
      phone: phone,
      id: id,
      position: position,
      department: department,
      email: email,
    );
  }
}

/// Назначение: добавление метода toEntity к AuthDto
/// Дата создания: 25.05.2026
/// Создал: Захар
extension UserAuthMapper on UserAuthDto {
  /// метод сериализации модели из [UserAuthDto] в [UserAuthEntity], возвращает [UserAuthEntity]
  ///
  /// [UserAuthDto] - модель слоя data
  /// [UserAuthEntity] - модель слоя domain
  UserAuthEntity toEntity() {
    return UserAuthEntity(record: record.toEntity(), token: token);
  }
}
