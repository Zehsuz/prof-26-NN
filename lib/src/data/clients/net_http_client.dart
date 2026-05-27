import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../net_service.dart';

part 'net_http_client.g.dart';

/// Назначение: описания запросов
/// Дата создания: 26.05.2026
/// Создал: Захар
@RestApi(callAdapter: ErrorAdapter)
abstract class NetHttpClient implements AuthHttpClient {
  factory NetHttpClient(Dio dio, {String? baseUrl}) = _NetHttpClient;

  @override
  @POST('/users/auth-with-password')
  Future<AuthResponse> login(@Body() AuthRequest request);
}
