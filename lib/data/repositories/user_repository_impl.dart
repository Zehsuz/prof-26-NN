import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/mappers/user_mapper.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

/// Назначение: иницилизация методов профиля
/// Дата создания: 25.05.2026
/// Создал: Захар
class UserRepositoryImpl implements UserRepository {
  final ApiDataSource _apiDataSource;

  UserRepositoryImpl({required this._apiDataSource});

  /// получение профиля полльзователя, принимает
  /// [id] - id пользователя,
  /// возвращает [UserAuthEntity]
  @override
  Future<UserEntity> getProfile({required String id}) async {
    final response = await _apiDataSource.getProfile(id: id);
    return response.toEntity();
  }
}
