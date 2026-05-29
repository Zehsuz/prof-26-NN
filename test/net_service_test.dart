import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:net_service/net_service.dart';

void main() {
  late NetHttpClient _client;
  late Dio _dio;

  setUp(() {
    _dio = Dio();
    _dio.options.headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer dBCNJOA47lX1Ad5ej53thzEIm6ycZL06T3-4H6kJBNrGOIpzUHdpCCZiNL7o0Wfv',
    };

    _client = NetHttpClient(
      _dio,
      baseUrl: 'https://fnch2026.hr.skillmad.ru',
    );
  });

  test('upload avatar', () async {
    final file = File('test/assets/123.png');
    final response = await _client.postProfile(file, 10);
    print('Avatar upload response: $response');
    expect(response, isNotNull);
  });

  test('upload vacancy PDF', () async {
    final file = File('test/assets/123.pdf');
    final response = await _client.uploadVacancyFile(file, 10);
    print('PDF upload response: $response');
    expect(response, isNotNull);
  });
}