import 'package:application/data/models/user_dto.dart';
import 'package:net_service/net_service.dart';

/// Назначение: вызов запросов из библиотеки
/// Дата создания: 25.05.2026
/// Создал: Захар
class ApiDataSource {
  final NetHttpClient _client;
  final AuthInterceptor _interceptor;

  ApiDataSource({required this._client, required this._interceptor});

  /// авторизация полльзователя, принимает [identity], [password], возвращает [UserAuthDto]
  Future<UserAuthDto> login({
    required String identity,
    required String password,
  }) async {
    final response = await _client.login(
      .new(identity: identity, password: password),
    );
    _interceptor.setToken(response.token);
    return .fromResponse(response);
  }

  /// регистрация полльзователя, принимает [email],[password],[passwordConfirm],[name],[firstName],[lastName],[middleName],[phone],[role],[isActive], возвращает [UserDto]
  Future<UserDto> signup({
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
    final response = await _client.signup(
      .new(
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
      ),
    );
    return .fromResponse(response);
  }
}
