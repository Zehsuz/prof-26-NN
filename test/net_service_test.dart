import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:net_service/net_service.dart';

final testString = DateTime.now().microsecondsSinceEpoch;
final email = '$testString@gmail.com';
final password = r'Pa$$w0rd';

void main() {
  Logger.root.level = .ALL;
  Logger.root.onRecord.listen((log) => print(log.message));
  late NetHttpClient _client;
  late AuthInterceptor interceptor;
  setUp(() {
    interceptor = AuthInterceptor();
    _client = NetHttpClient(
      Dio()..interceptors.addAll([interceptor, LoggingInterceptor()]),
      baseUrl: 'http://109.248.226.223:8080/api/collections',
    );
  });

  test('login', () async {
    final response = await _client.login(
      .new(identity: 'qwe@qwe.qwe', password: 'qweqweqwe'),
    );
    expect(response, isA<AuthResponse>());
  });
}
