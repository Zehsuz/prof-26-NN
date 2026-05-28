import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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
    final qwe = Image.asset('asd');
    final qweasd = File
    await _client.postProfile(, id)
    expect(() => _client.login('qwe'), returnsNormally);
  });
}
