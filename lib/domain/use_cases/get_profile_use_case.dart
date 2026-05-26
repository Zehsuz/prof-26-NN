import 'package:application/domain/exceptions/exception.dart';
import 'package:application/domain/repositories/user_repository.dart';

import '../models/user.dart';

/// Назначение: Сценарий получения профиля
/// Дата создания: 26.05.2026
/// Создал: Захар
class GetProfileUseCase {
  final UserRepository _userRepository;

  GetProfileUseCase({required this._userRepository});

  /// получение профиля полльзователя, принимает
  /// [id] - id пользователя,
  /// возвращает [UserAuthEntity]
  Future<UserEntity> call({required String id}) async {
    try {
      final response = await _userRepository.getProfile(id: id);
      return response;
    } on Exception catch (e) {
      throw ProfileDomainException(
        message: 'Ошибка получения профиля',
        operation: 'getProfile',
        cause: e,
      );
    }
  }
}
