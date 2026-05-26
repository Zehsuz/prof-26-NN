import 'package:application/domain/models/user.dart';

/// Назначение: определение методов пользователя
/// Дата создания: 25.05.2026
/// Создал: Захар
abstract interface class UserRepository {
  /// получение профиля полльзователя, принимает
  /// [id] - id пользователя,
  /// возвращает [UserAuthEntity]
  Future<UserEntity> getProfile({required String id});
}
